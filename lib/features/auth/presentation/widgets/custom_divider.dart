import 'package:flutter/material.dart';

Widget CustomDivider(bool isDarkMode) {
  return Row(
    children: [
      Expanded(
        child: Divider(color: isDarkMode ? Colors.white30 : Colors.black26),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Or',
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.black54,
          ),
        ),
      ),
      Expanded(
        child: Divider(color: isDarkMode ? Colors.white30 : Colors.black26),
      ),
    ],
  );
}
