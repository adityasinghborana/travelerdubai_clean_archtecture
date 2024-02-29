import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/bookings/bookings.dart';
import 'package:travelerdubai/checkout/presentation/checkout.dart';
import 'package:travelerdubai/creditcard/creditcard.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/tours_screen.dart';
import 'package:travelerdubai/events/presentation/events.dart';

import 'package:travelerdubai/core/homescreen.dart';
import 'package:travelerdubai/contactus/presentation/Contactus.dart';
import 'package:travelerdubai/Aboutus/presenation/Aboutus.dart';
import 'package:travelerdubai/experiences/Presentation/experiences.dart';

import 'package:travelerdubai/auth/presentation/screens/signin.dart';
import 'package:travelerdubai/auth/presentation/screens/signup.dart';

import 'package:travelerdubai/userdashboard/dashboardpage.dart';

import 'auth/presentation/sign_in_controller.dart';

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

  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  // Thiswidget is the root of your application.
  @override
  Widget build(BuildContext Context) {

    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/Login',
          page: () => SigninPage(),
          middlewares: [MyMiddelware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/Signup',
          page: () => SignupPage(),
          middlewares: [MyMiddelware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/home',
          page: () => Homescreen(),
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
          page: () =>  DashboardPage(),
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
          name: '/bookings',
          page: () => BookingPage(),
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
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
