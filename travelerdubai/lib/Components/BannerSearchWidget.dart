import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class HeaderSearchWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final TextEditingController searchController;
  final Function(String) onSearch;

  const HeaderSearchWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: Get.height * 0.25,
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.05),
                    Text(title, style: H1(context)),
                    SizedBox(height: Get.height * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: onSearch,
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}