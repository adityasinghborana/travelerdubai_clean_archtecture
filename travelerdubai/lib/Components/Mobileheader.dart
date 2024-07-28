import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final BuildContext context;

  const MobileHeader(
      {super.key, this.isBackButton = true, required this.context});

  @override
  Widget build(BuildContext context) {
    final HeaderController controller = Get.find();final height = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: isBackButton,
      leading: isBackButton
          ? IconButton(
              onPressed: () {
Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            )
          : IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
      backgroundColor: colorwhite,
      surfaceTintColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               Flexible(
               flex:7,child: InkWell(
               onTap: () {
                 if (Get.currentRoute.contains("/tour_details")) {

                   Get.offNamed('/home'); // Replace the current route
                 } else {
                   print("pushnamed ");
                   Get.toNamed( '/home'); // Push a new route
                 }
               },
               child: Center(
                 child: Image.asset(
                   images.logo,
                   width: MediaQuery.of(context).size.width * 0.4,
                   height: height * .05,
                 ),
               ),
                              ),),
                Flexible(flex: 1, child: Container(
                  child: IconButton(icon: Icon(Icons.account_circle,size: 26,),onPressed: (){
                    if(controller.loggedIn==true){
                      Get.toNamed("/dashboardpage");
                    }
                    else{
                      Get.toNamed('/login');
                    }
                  },),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
