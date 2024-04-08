import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';


import '../tourdetails/presentation/Widgets/detailbox.dart';
import '../tourdetails/presentation/Widgets/html.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: DetailBox(
    isExpanded: true,
    title: "PrivacyPolicy",
    Description: HtmlDisplayWidget(
    htmlContent: "Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy "),
    textStyle:bodyblack(context),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: DetailBox(
    isExpanded: true,
    title: "Terms And Condition",
    Description: HtmlDisplayWidget(
    htmlContent: "Terms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And ConditionTerms And Condition "),
    textStyle:bodyblack(context),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: DetailBox(
    isExpanded: true,
    title: "Cancelation Policy",
    Description: HtmlDisplayWidget(
    htmlContent: "Cancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation Policy "),
    textStyle:bodyblack(context),
    ),
    ),
    ]
    );
  }
}
