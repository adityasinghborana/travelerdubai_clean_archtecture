import 'package:flutter/cupertino.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> productdetail = [
    {
      "title": "Tour 1",
      "image": "https://source.unsplash.com/random/tour",
      "price": 70,
    },
    {
      "title": "Tour 2",
      "image": "https://source.unsplash.com/random/dubai",
      "price": 20,
    },
    {
      "title": "Tour 3",
      "image": "https://source.unsplash.com/random/tours",
      "price": 50,
    },
    {
      "title": "Tour 4",
      "image": "https://source.unsplash.com/random/burjkhalifa",
      "price": 30,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productdetail.map((product) {
        return Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(product["image"],fit: BoxFit.cover,)),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product["title"]),
                  Text("Price ${product["price"]} AUD"),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}