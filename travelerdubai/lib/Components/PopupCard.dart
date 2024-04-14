import 'package:flutter/material.dart';

class PopupCard extends StatelessWidget {
  const PopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background with semi-transparent color
        Container(
          color: Colors.black.withOpacity(0.5),
          // You can adjust the opacity value to your preference
        ),
        // Card widget
        Center(
          child: Card(
            margin: const EdgeInsets.all(30.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Popup Card',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'This is a sample popup card.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
