
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/AboutPage/presentationlayer/Aboutus.dart';
import 'package:travelerdubai/auth/presentation/screens/signin.dart';
import 'package:travelerdubai/auth/presentation/screens/signup.dart';
import 'package:travelerdubai/core/helperfunctions.dart';
import 'package:travelerdubai/core/homescreen.dart';
import 'package:travelerdubai/creditcard/creditcard.dart';
import 'package:travelerdubai/eventcheckout/eventcheckout.dart';
import 'package:travelerdubai/experiences/Presentation/experiences.dart';
import 'package:travelerdubai/paymentconfirmation/presentationlayer/failure.dart';
import 'package:travelerdubai/paymentconfirmation/presentationlayer/success.dart';
import 'package:travelerdubai/policy_Pages/cancelationpolicy.dart';
import 'package:travelerdubai/policy_Pages/privacyPolicy.dart';
import 'package:travelerdubai/policy_Pages/refundPolicy.dart';
import 'package:travelerdubai/policy_Pages/termsandcondition.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/controllers_bindings.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/forms_mobile.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/tours_screen.dart';
import 'package:travelerdubai/userdashboard/dashboardpage.dart';

import 'NotFound/404Screen.dart';

import 'checkout/presentation/checkoutscreen.dart';
import 'contactus/presentation/contactusScreen.dart';
import 'core/controller/headercontroller.dart';
import 'eventDetails/eventdetails.dart';
import 'events/presentation/event.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA4f2YsvWuQ8GCn8FvPC82LUvQW493Fau8",
        authDomain: "travelerdubai-9a6ed.firebaseapp.com",
        projectId: "travelerdubai-9a6ed",
        storageBucket: "travelerdubai-9a6ed.appspot.com",
        messagingSenderId: "191732956201",
        appId: "1:191732956201:web:3c7e9bbaeaa8f025d5f038",
        measurementId: "G-4PG69HVJ6C"),
  );

  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);

  cartItemsLength.value = prefs.getInt('Cartlength')??0;
  Get.put(HeaderController());
  var stripePublishableKey =
      "pk_test_51MWclzAtjY5SrUmvHfAfot6xsT2EhUUVZHCZpKwaLcezfQz8ZomKbYoRUFakOzZ5GsprJSnQcXnPxAh2GOFqXUER00MAwLuclq";
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return ResponsiveApp(
      builder: (context) => GetMaterialApp(
          theme: ThemeData(   useMaterial3: true, ),

        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        debugShowCheckedModeBanner: false,
        unknownRoute: GetPage(
          name: '/notfound',
          page: () => PageNotFound(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/login',
            page: () => SigninPage(),

          ),
          GetPage(
            name: '/Signup',
            page: () => const SignupPage(),

          ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),

          ),
          GetPage(
            name: '/Aboutus',
            page: () => AboutUsPage(),

          ),
              GetPage(
                name: '/contactus',
                page: () =>  Contactus(),

              ),
              GetPage(
                name: '/experiences',

                page: () => Experiences(),

              ),
              GetPage(
                name: '/dashboardpage',
                page: () => DashboardPage(),

              ),
              GetPage(
                name: '/tour_details',
                page: () => const TourPage(),
                binding: ControllerBindings(),

              ),
              GetPage(
                name: '/forms_mobile',
                page: () => FormsMobile(),
                binding: ControllerBindings(),

              ),

              GetPage(
                name: '/events',
                page: () => Event(),

              ),
          GetPage(
            name: '/eventcheckout',
            page: () => EventCheckOut(),


          ),
          GetPage(
            name: '/eventdetails',
            page: () => EventDetails(),

          ),
              GetPage(
                name: '/checkout',
                page: () => const Checkout(),

              ),
              GetPage(
                name: '/payment',
                page: () => CardPaymentScreen(),

              ),GetPage(
                name: '/payments',
                page: () =>PaymentSuccess(),

              ),
              GetPage(
                name: '/fail',
                page: () =>FailureScreen(),

              ),
              GetPage(
                name: '/privacypolicy',
                page: () =>PolicyPage(),

              ),
              GetPage(
                name: '/termsandcondition',
                page: () =>TermsandCondition(),

              ),
              GetPage(
                name: '/refundpolicy',
                page: () =>RefundPolicy(),

              ),
              GetPage(
                name: '/cancelationpolicy',
                page: () =>CancelationPolicy(),
              ),
      
            ],
                    ),
      );
  }
}


