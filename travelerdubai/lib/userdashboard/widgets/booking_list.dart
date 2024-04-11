import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';
class BookingsList extends StatelessWidget {



  BookingsList({Key? key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller  = ScrollController();

    final DashBoardController dashBoardController = Get.find();

    return Container(
      margin: EdgeInsets.only(top: Get.width*0.04),
      width: Get.width ,

    
      child: ListView.builder(
        controller: controller,
        itemCount:dashBoardController.userBookingList.length ,
        itemBuilder: (context, index) {
          final list = dashBoardController.userbookings[index];
          final completeList= dashBoardController.userBookingList;
          return Container(
margin: EdgeInsets.symmetric(vertical: Get.height*0.02),
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            ),
            height: Get.width*0.18,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:Get.width*0.04, vertical: Get.height*0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${list.createdAt.toString().substring(0,10)}",style: bodyblack(context).copyWith(fontWeight: FontWeight.normal ,fontSize: Get.width*0.01,color: colorlightgrey)),
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Flexible(
                       flex: 1,
                       child: Row(

                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Booking Id",style: bodyblack(context).copyWith(fontWeight: FontWeight.normal ,fontSize: Get.width*0.01,color: colorlightgrey),),
                             SizedBox(height: 10,),
                             Text("${list.bookingId}",style: bodyblack(context).copyWith(fontWeight: FontWeight.bold ,fontSize: Get.width*0.012),),
                           ],
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Service Type",style: bodyblack(context).copyWith(fontWeight: FontWeight.normal ,fontSize: Get.width*0.01,color: colorlightgrey),),
                             SizedBox(height: 10,),
                             Text("${list.serviceType.capitalizeFirst}",style: bodyblack(context).copyWith(fontWeight: FontWeight.bold ,fontSize: Get.width*0.012),),
                           ],
                         ),
                       ],),
                     ),

                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Status",style: bodyblack(context).copyWith(fontWeight: FontWeight.normal ,fontSize: Get.width*0.01,color: colorlightgrey),),
                            SizedBox(height: 10,),
                            Text("${list.status.capitalizeFirst}",style: bodyblack(context).copyWith(fontWeight: FontWeight.bold ,fontSize: Get.width*0.012),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Reference No",style: bodyblack(context).copyWith(fontWeight: FontWeight.normal ,fontSize: Get.width*0.01,color: colorlightgrey),),
                          SizedBox(height: 10,),
                          Text("${completeList[index].referenceNo}",style: bodyblack(context).copyWith(fontWeight: FontWeight.bold ,fontSize: Get.width*0.012),),
                        ],
                      ),
                      InlineFlexButton(
                        borderwidth: 1,
                        textcolor: colorblack,
                        vpadding: Get.height*0.02,
                        hpadding: Get.width*0.01,

                        label: "Download Ticket",
                        onPressed: () => Get.snackbar("Downloading Ticket", "Your Ticket is being Downloaded"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

