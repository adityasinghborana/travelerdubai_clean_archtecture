import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/get_cart_usecase.dart';
import 'package:travelerdubai/auth/presentation/screens/Desktop/signin_desktop.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/create_user_usecase.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../usersdatalayer/service/create_user_remote.dart';
import 'mobile/Signinmobile.dart';

class SigninPage extends StatelessWidget {
  final controller = Get.put(
    SigninController(
      createuser: CreateUserUseCase(
        UserRepositoryImpl(
          createUserRemoteService(
            Dio(),
          ),
        ),
      ),
      getCartUseCase: GetCartUseCase(
        CartRepositoryImpl(
          CartRemoteService(Dio()),
        ),
      ),
    ),
  );

  SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {

        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop || sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return SigninDesktop();
        }


        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return SigninMobile();
        } else{
          return SigninDesktop();
        }
      },
    );
  }
}
