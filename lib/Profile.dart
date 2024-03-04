import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          CircleAvatar(
            radius: 40,
            child: Icon(
              Icons.account_circle,
              color: Colors.indigo,
              size: 70,
            ),
          ),
          Container(
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Rerere00.1h@gmail.com',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
