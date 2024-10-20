import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final bool isDarkMode;
  final Icon? prefixIcon;

  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscure = false,
      this.isDarkMode = false,
      this.prefixIcon = null});

  @override
  _AuthFieldState createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
      obscureText: _isObscure,
      validator: (value) {
        if (value!.isEmpty) {
          return "${widget.hintText} is missing";
        }
        return null;
      },
    );
  }
}
