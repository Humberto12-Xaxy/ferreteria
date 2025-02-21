import 'package:flutter/material.dart';

import 'widgets.dart';

class NavBarWidget extends StatelessWidget {
  final List<CustomButton> buttons;

  const NavBarWidget({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Tres Hermanas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.construction,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: buttons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
