import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final IconData expandedIcon;
  final IconData collapsedIcon;

  CustomExpansionTile({
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
    required this.expandedIcon,
    required this.collapsedIcon,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.title,
                Icon(
                  _isExpanded ? widget.expandedIcon : widget.collapsedIcon,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          ...widget.children,
      ],
    );
  }
}

