import 'package:flutter/material.dart';

class ListTileNodeWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ListTileNodeWidget({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
