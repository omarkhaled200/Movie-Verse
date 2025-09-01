import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.hintcolor,
    this.textcolor,
    this.valdiate,
    this.onchanged,
    this.onpressed,
    this.typekeyboard,
  });
  TextInputType? typekeyboard;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color? hintcolor;
  final Color? textcolor;
  void Function(String)? onchanged;
  final String? Function(String?)? valdiate;
  final void Function()? onpressed;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.typekeyboard,
      validator: widget.valdiate,
      onChanged: widget.onchanged,
      cursorColor: Color(0xff3b82f6),
      style: TextStyle(
        color: widget.textcolor,

        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      obscureText: isObscure,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white),
        errorMaxLines: 7,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Color(0xff3b82f6), size: 24)
            : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(widget.suffixIcon, size: 24),
                color: Color(0xff3b82f6),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintcolor,

          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineinputBorder(),
        border: OutlineinputBorder(),
        focusedBorder: OutlineinputBorder(),
      ),
    );
  }

  OutlineInputBorder OutlineinputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffA0A0A0), width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
