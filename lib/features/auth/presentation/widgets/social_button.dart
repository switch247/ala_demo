import 'package:flutter/material.dart';

Widget SocialButton(
    {required String text,
    required String assetName,
    required VoidCallback onPressed,
    required bool isDarkMode}) {
  return OutlinedButton(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetName,
            height: 26,
            width: 26,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black),
          ),
        ],
      ),
    ),
    style: OutlinedButton.styleFrom(
      foregroundColor: isDarkMode ? Colors.white : Colors.black,
      side: BorderSide(color: isDarkMode ? Colors.white30 : Colors.black26),
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: onPressed,
  );
}
