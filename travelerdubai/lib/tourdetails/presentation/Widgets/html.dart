import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart' as htmlDom;
import 'package:html/parser.dart' as htmlParser;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/constants/contants.dart';


class HtmlDisplayWidget extends StatelessWidget {
  final String? htmlContent;

  const HtmlDisplayWidget({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    final document = htmlParser.parse(htmlContent);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _parseNodes(document.body!.nodes),
      ),
    );
  }

  List<Widget> _parseNodes(List<htmlDom.Node> nodes) {
    List<Widget> widgets = [];

    for (var node in nodes) {
      if (node is htmlDom.Element) {
        widgets.addAll(_parseNodes(node.nodes));
      } else if (node is htmlDom.Text) {
        final textNodes = node.text.split(RegExp(r'\r?\\n'));
        for (var i = 0; i < textNodes.length; i++) {
          final trimmedText = textNodes[i].trim();
          if (trimmedText.isNotEmpty) {
            widgets.add(HtmlTextWithLineBreaks(trimmedText));
          }
        }
      }
    }

    return widgets;
  }
}

class HtmlTextWithLineBreaks extends StatelessWidget {
  final String text;

  HtmlTextWithLineBreaks(this.text);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double fontSize = sizingInformation.deviceScreenType == DeviceScreenType.mobile || sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? MediaQuery.of(context).size.width * 0.018
            : MediaQuery.of(context).size.width * 0.01;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: text
              .split('<br>')
              .map((line) => Text(
            line.trim(),
            style: TextStyle(
              letterSpacing: .5,
              fontSize: fontSize,
              color: colorblack,
            ),
          ))
              .toList(),
        );
      },
    );
  }
}
