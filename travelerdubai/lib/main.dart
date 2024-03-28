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
import 'package:travelerdubai/checkout/presentation/checkout.dart';
import 'package:travelerdubai/contactus/presentation/Contactus.dart';
import 'package:travelerdubai/core/homescreen.dart';
import 'package:travelerdubai/creditcard/creditcard.dart';
import 'package:travelerdubai/events/presentation/events.dart';
import 'package:travelerdubai/experiences/Presentation/experiences.dart';
import 'package:travelerdubai/paymentconfirmation/presentationlayer/failure.dart';
import 'package:travelerdubai/paymentconfirmation/presentationlayer/success.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/tours_screen.dart';
import 'package:travelerdubai/userdashboard/dashboardpage.dart';

import 'NotFound/404Screen.dart';
import 'core/controller/headercontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var stripePublishableKey =
      "pk_test_51MWclzAtjY5SrUmvHfAfot6xsT2EhUUVZHCZpKwaLcezfQz8ZomKbYoRUFakOzZ5GsprJSnQcXnPxAh2GOFqXUER00MAwLuclq";
  Stripe.publishableKey = stripePublishableKey;
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
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  Get.put(HeaderController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    // final  HeaderController headerController = Get.put(HeaderController());

    return ResponsiveApp(
      builder: (context) => GetMaterialApp(
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
          name: '/NotFound',
          page: () => PageNotFound(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/Login',
            page: () => SigninPage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/Signup',
            page: () => SignupPage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/Aboutus',
            page: () => AboutUsPage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/contactus',
            page: () => const Contactus(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/experiences',
            page: () => Experiences(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/dashboardpage',
            page: () => DashboardPage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/tour_details',
            page: () => TourPage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/events',
            page: () => Eventspage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),

          GetPage(
            name: '/checkout',
            page: () => CheckoutPage(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/payment',
            page: () => CardPaymentScreen(),
            transition: Transition.circularReveal,
            transitionDuration: const Duration(milliseconds: 500),
          ),

        ],
      ),

    );
  }
}
