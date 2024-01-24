import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/creditcard/creditcard_controller.dart';

class CardPaymentScreen extends StatelessWidget {
  final CardPaymentController _controller = Get.put(CardPaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Card Details Here'),
      ),
      body: Flexible(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: Get.width / 3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: Get.height / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/logo.png"),
                          Obx(
                            () => CreditCardWidget(
                              width: double.infinity,
                              height: Get.height / 4,
                              backgroundImage: "assets/event.jpg",
                              cardNumber: _controller.cardNumber.value,
                              expiryDate: _controller.expiryDate.value,
                              cardHolderName: _controller.name.value,
                              cvvCode: _controller.cvv.value,
                              showBackView: false,
                              onCreditCardWidgetChange:
                                  (CreditCardBrand creditCardBrand) {},
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          TextField(
                            onChanged: (value) =>
                                _controller.name.value = value,
                            decoration:
                                InputDecoration(labelText: 'Name on Card'),
                          ),
                          TextField(
                            onChanged: (value) =>
                                _controller.cardNumber.value = value,
                            decoration:
                                InputDecoration(labelText: 'Card Number'),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: (value) =>
                                      _controller.expiryDate.value = value,
                                  decoration:
                                      InputDecoration(labelText: 'Expiry Date'),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) =>
                                      _controller.cvv.value = value,
                                  decoration: InputDecoration(labelText: 'CVV'),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorPrimary,
                              foregroundColor: colorwhite,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize:
                                  Size(double.infinity, 40), //////// HERE
                            ),
                            onPressed: () async {
                              await _controller
                                  .payNow(); // Call the payNow function
                              if (_controller.status.value == "success") {
                                Get.toNamed("bookings");
                              } else {
                                Get.snackbar("Failed", "Your payment failed");
                              }
                            },
                            child: Text('Pay Now'),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
