import 'package:flutter/material.dart';

Widget WelcomeContainer(BuildContext context, bool isDarkMode) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 14),
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_icon.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Aladia,',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                'Create or access your account from here',
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
