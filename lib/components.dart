import 'package:flutter/material.dart';

 String uId = '';

Widget ButtonLogin({
   double? width,
  Color background = Colors.blue,
  bool isUpperCase = true,
   double? height,
  void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text.toLowerCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget TextButtom({
  required TextEditingController controller,
  TextInputType? type,
  required String lable,
  IconData? icon,
  required String? Function(String?)? validator,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixpress,
   bool? condition,
}) =>
   TextFormField(
        controller: controller,
        onFieldSubmitted: (value) {
          print(value);
        },
        validator: validator,
        obscureText: isPassword,
        keyboardType: type, //  no3 alhktbo gawa ya3ne number aw text....
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(
            icon,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixpress,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: OutlineInputBorder(),

      ),
    );





