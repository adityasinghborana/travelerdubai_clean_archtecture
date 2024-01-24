import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 237, 237, 237),
          ),
          padding: const EdgeInsets.all(50.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildImageSection(),
              ),
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildReplySection(),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildReplySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leave A Reply',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        const Text(
          'Your email address will not be published. Required fields are marked *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(hintText: "Name")),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(hintText: "Email")),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(hintText: "Subject")),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: const Text('Submit'))
      ],
    );
  }
}
