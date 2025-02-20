import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;
  final double padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white),
            Text(text, style: TextStyle(fontSize: 15, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
