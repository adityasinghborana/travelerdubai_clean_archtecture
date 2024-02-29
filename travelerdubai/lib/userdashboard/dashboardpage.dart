import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';

class DashboardPage extends StatelessWidget {
  final DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Dashboard'),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Profile'),
                      Tab(text: 'Bookings'),
                    ],
                    onTap: (index) {
                      controller.selectedIndex.value = index;
                      print(index);
                    },
                  ),
                ),
                body: GetBuilder<DashBoardController>(

                  builder: (controller) => TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // First Tab: Profile
                      Visibility(
                        visible: controller.selectedIndex.value == 0,
                        child: Container(
                          height: 200,
                          child: Text("hello"),
                        ),
                      ),

                      // Second Tab: Bookings
                      Visibility(
                        visible: controller.selectedIndex.value ==1,
                        child: Container(
                          height: 200,
                          child: ProfileInfo(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
