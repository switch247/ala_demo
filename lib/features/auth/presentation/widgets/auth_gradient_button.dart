import 'package:aladia/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final isDarkMode;
  const AuthGradientButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[500]!,
              Colors.grey[600]!,
              Colors.grey[500]!,
              Colors.grey[900]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
