import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String value;
  const CustomRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
          ),
          Text(value),
        ],
      ),
    );
  }
}
