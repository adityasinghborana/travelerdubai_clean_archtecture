// class payments extends StatefulWidget {
//   @override
//   _paymentsState createState() => _paymentsState();
// }
//
// class _paymentsState extends State<payments> {
//   CardFieldInputDetails _card = CardFieldInputDetails(complete: false);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('HTML Viewer'),
//         ),
//         body: Column(
//           children: [
//             CardField(
//               onCardChanged: (card) {
//                 setState(() {
//                   _card = card ?? CardFieldInputDetails(complete: false);
//                 });
//               },
//             ),
//             if (_card?.complete ?? false)
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_card?.complete ?? false) {
//                     // Create PaymentMethodParams for card from method ID
//
//
//                     // Call the confirmPayment function when the card details are complete
//
//                   } else {
//                     // Handle the case where card details are not complete
//                     print('Please enter complete card details.');
//                   }
//                 },
//                 child: Text('Pay'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
