import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
          child: Text(
        name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      )),
      subtitle: const Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            'Batch: 57',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            'Department of CSE',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            'Leading University, Sylhet',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      tileColor: Colors.grey.shade100,
    );
  }
}
