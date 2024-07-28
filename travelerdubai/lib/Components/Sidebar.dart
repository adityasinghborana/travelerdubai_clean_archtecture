import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class TourTypes extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String) onTap;

  const TourTypes({
    super.key,
    required this.title,
    required this.items,
    required this.onTap,
  });

  @override
  _TourTypesState createState() => _TourTypesState();
}

class _TourTypesState extends State<TourTypes> {
  String? _selectedItem;

  void _handleTap(String item) {
    setState(() {
      if (_selectedItem == item) {
        _selectedItem = null;
        widget.onTap('');
      } else {
        _selectedItem = item;
        widget.onTap(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController listController = ScrollController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: backgroundgradient,
            boxShadow: [
              BoxShadow(
                color: colorPrimary.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.011, vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.title} ',
                          style: TextStyle(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  colorHighlights,
                                  colorPrimary
                                ],
                              ).createShader(Rect.fromLTWH(
                                  Get.width * 0.05,
                                  20.0,
                                  80.0,
                                  20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.8,
                    child: ListView.builder(
                      controller: listController,
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        String item = widget.items[index];
                        return HoverCard(
                          item: item,
                          isSelected: _selectedItem == item,
                          onTap: () => _handleTap(item),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String item;
  final bool isSelected;
  final VoidCallback onTap;

  HoverCard({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
      child: Card(
        surfaceTintColor: colorwhite,
        elevation: 4,
        child: InkWell(
          onTap: widget.onTap,
          child: MouseRegion(
            onEnter: (_) => setState(() {
              _isHovered = true;
            }),
            onExit: (_) => setState(() {
              _isHovered = false;
            }),
            child: Container(
              decoration: BoxDecoration(
                color: widget.isSelected ? Colors.blueAccent : (_isHovered ? Colors.blueAccent.withOpacity(0.9) : Colors.white),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: colorlightgrey.withOpacity(0.2),
                  width: 2.0,
                ),
              ),
              height: Get.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.009),
                      child: Text(
                        widget.item,
                        textAlign: TextAlign.center,
                        style: bodyBlack(context).copyWith(
                          fontSize: 12,
                          color: widget.isSelected || _isHovered ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
