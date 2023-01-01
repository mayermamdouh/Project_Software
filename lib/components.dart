import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String uId = '';

bool  isTrue_Product = false;
bool isFavorite1 = false;
late String url;

String? userName;
String? userAge;
String? userPhone;
String? userEmail;

getUserDataIndividal() async {
  //query the user photo
  await FirebaseFirestore.instance.collection("UserRegister").doc(uId).snapshots().listen((event) {
    userName = event.get("Name");
    userAge = event.get("Age");
    userPhone = event.get("PhoneNumber");
    userEmail = event.get("Email");
  });
}


Widget ButtonLogin({
   double? width,
  Color? color = Colors.blue,
  bool isUpperCase = true,
   double? height,
   double? fontSize  = 15.0,
  void Function()? function,
  required String text,
}) =>
    Container(

      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text.toString(),
          style:  TextStyle(
            color: Colors.white,
            fontSize: fontSize,
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
  TextInputType? keyboardType,
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
          border:  OutlineInputBorder(),

      ),
    );








