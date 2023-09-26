import 'package:flutter/material.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          ),
          SizedBox(
            height: 16,
          ),
          Text('Icha')
        ],
      ),
    );
  }
}
