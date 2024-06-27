import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_web/card_field.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/checkout_controller.dart';
import 'package:travelerdubai/paymentconfirmation/presentationlayer/failure.dart';

import '../Cart/data_layer/repository/cart_repository.dart';
import '../Cart/data_layer/service/cart_remote.dart';
import '../Cart/data_layer/usecase/deletecart_usecase.dart';
import '../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../bookings/data_layer/repository/bookings_repository.dart';
import '../bookings/data_layer/service/booking_remote.dart';
import '../bookings/data_layer/usecase/bookings_usecase.dart';
import '../checkout/data_layer/repository/Intent_repository.dart';
import '../checkout/data_layer/service/remote.dart';
import '../checkout/data_layer/usecase/intent_usecase.dart';
import '../paymentconfirmation/presentationlayer/success.dart';


class CardPaymentScreen extends StatefulWidget {
  @override
  _CardPaymentScreenState createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  CardFieldInputDetails? _card;
  CardEditController controller = CardEditController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Card Details Here'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Get.width>600? MediaQuery.of(context).size.width * .25:MediaQuery.of(context).size.width *.8,

              child: WebCardField(
                width: 30,
                style: CardStyle(borderWidth: 4,backgroundColor: Colors.red),

                onCardChanged: (card) {
                  setState(() {
                    _card = card;
                  });
                },
                controller: controller,
              ),
            ),
          ),
          SizedBox(height: 50),
          if (_card?.complete ?? false)
            ElevatedButton(
              onPressed: () async {
                if (_card?.complete ?? false) {
                  await createPaymentMethod().then((value) {
                    confirmPayment();
                  });
                  // Continue with the payment process if needed
                } else {
                  // Handle the case where card details are not complete
                  print('Please enter complete card details.');
                }
              },
              child: Text('Pay'),
            ),
        ],
      ),
    );
  }

  Future<void> createPaymentMethod() async {
    CheckoutController checkoutController = Get.put(
      CheckoutController(
          deleteCartItemUseCase:DeleteCartItemUseCase(CartRepositoryImpl(CartRemoteService(Dio()),)),
          getCartUseCase: GetCartUseCase(
            CartRepositoryImpl(
              CartRemoteService(Dio()),
            ),
          ),
          intentUseCase: IntentUseCase(
            StripeIntentRepositoryImpl(
              StripeRemoteService(Dio()),
            ),
          ),
          doBookingUseCase: DoBookingUseCase(
            BookingsRepositoryImpl(
              BookingsRemoteService(
                Dio(),
              ),
            ),
          )),
    );
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
          billingDetails: BillingDetails(
            name: 'Jenny Rosen',
          ),
        )),
      );

      // Do something with the paymentMethod.id if needed
      print('PaymentMethod created: ${paymentMethod.id}');
      checkoutController.paymentmethodid.value = paymentMethod.id;
    } catch (e) {
      // Handle errors
      print('Error creating PaymentMethod: $e');
    }
  }

  Future<void> confirmPayment() async {
    CheckoutController checkoutController = Get.put(

      CheckoutController(
          deleteCartItemUseCase:DeleteCartItemUseCase(CartRepositoryImpl(CartRemoteService(Dio()),)),
        getCartUseCase: GetCartUseCase(
          CartRepositoryImpl(
            CartRemoteService(Dio()),
          ),
        ),
        intentUseCase: IntentUseCase(
          StripeIntentRepositoryImpl(
            StripeRemoteService(Dio()),
          ),
        ),
        doBookingUseCase: DoBookingUseCase(
          BookingsRepositoryImpl(
            BookingsRemoteService(
              Dio(),
            ),
          ),
        ),
      ),
    );
    try {
      final confirmation = await Stripe.instance.confirmPayment(
          paymentIntentClientSecret: checkoutController.stripeclientkey.value,
          data: PaymentMethodParams.cardFromMethodId(
              paymentMethodData: PaymentMethodDataCardFromMethod(
                  paymentMethodId: checkoutController.paymentmethodid.value)));

      if (confirmation.status == PaymentIntentsStatus.Succeeded) {

        checkoutController.doBookings();

       
      } else {
       print("Paymnet intent failed ");
        Get.off(const FailureScreen());
      }
    } catch (e) {
      // Handle errors
      print('Error confirming payment: $e');
    }
  }
}
