import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class User_Register_model{
   late String name ;
   late String phoneNumber;
   late String age;
   late String email;
   late String password;
   late String uId;
 //  late bool isEmailVerified;



   User_Register_model({
     required this.name,
     required this.phoneNumber,
     required this.age,
     required this.email,
     required this.password,
     required this.uId,
   //  required this.isEmailVerified,

   }) {

}

   User_Register_model.fromJson(Map <String,dynamic>? json ){

     name = json!['Name'];
     phoneNumber = json!['PhoneNumber'];
     age = json['Age'];
     email = json['Email'];
     password = json['Password'];
     uId = json['uId'];
   //  isEmailVerified = json['isEmailVerified'];

   }
   //convert data to map
   Map<String,dynamic> ToMap(){
     return {
       'Name':name,
       'PhoneNumber':phoneNumber,
       'Age':age,
       'Email':email,
       'Password':password,
       'uId':uId,
     };
   }
}


class Customer_Upload_product{
  late String ItemName ;
  late String ItemDescription;
  late String ChildAgeMonth;
  late String ChildAgeYear;
  late String Size;
  late String Category;
  late File? Photo;

  //  late bool isEmailVerified;

  Customer_Upload_product({
    required this.ItemName,
    required this.ItemDescription,
    required this.ChildAgeMonth,
    required this.ChildAgeYear,
    required this.Size,
    required this.Category,

    //  required this.isEmailVerified,

  }) {

  }

  Customer_Upload_product.fromJson(Map <String,dynamic>? json ){

    ItemName = json!['Product Name'];
    ItemDescription = json!['Product Description '];
    ChildAgeMonth = json['Child Age Month'];
    ChildAgeYear = json['Child Age Year'];
    Size = json['Product Size'];
    Category = json['Product Category'];



  }
  //convert data to map
  Map<String,dynamic> ToMap(){
    return {
      'Product Name':ItemName,
      'Product Description':ItemDescription,
      'Child Age Month':ChildAgeMonth,
      'Child Age Year':ChildAgeYear,
      'Product Size':Size,
      'Product Category':Category,

    };
  }
}





void Upload_Product_create({
  required String ItemName,
  required String ItemDescription,
  required String ChildAgeMonth,
  required String ChildAgeYear,
  required String Size,
  required String Category,

}) {

  Customer_Upload_product model= Customer_Upload_product(
      ItemName:ItemName ,
      ItemDescription: ItemDescription,
      ChildAgeMonth: ChildAgeMonth,
      ChildAgeYear: ChildAgeYear,
      Size: Size,
      Category: Category,

  );
  FirebaseFirestore.instance.collection('CustomerProduct')
      .doc(ItemName).set(model.ToMap())
      .then((value) {
    print('Upload Product success');
  })
      .catchError((error){
    print(error.toString());

    print(error );
  });
}
