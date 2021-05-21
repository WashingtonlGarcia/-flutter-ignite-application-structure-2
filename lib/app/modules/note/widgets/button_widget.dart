import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ButtonWidget({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).accentColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 56,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
