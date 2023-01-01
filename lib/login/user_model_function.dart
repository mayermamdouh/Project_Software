
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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





void Upload_Product_create({
  required String ItemName,
  required String ItemDescription,
  required int Price,
  required String ChildAgeYear,
  required String Size,
  required String Category,
  required String Photo,

}) {

  Product model= Product(
      ItemName:ItemName ,
      ItemDescription: ItemDescription,
       Price:Price ,
      ChildAgeYear: ChildAgeYear,
      Size: Size,
      Category: Category,
      Photo:Photo ,

    //Photo: Photo,
   // Photo: Photo,

  );
  FirebaseFirestore.instance.collection('Product')
      .doc(ItemName).set(model.ToMap())
      .then((value) {
    print('Upload Product success');
  })
      .catchError((error){
    print(error.toString());

    print(error );
  });
}




class FirestoreDB{
  Stream<List<Product>> getAllProducts() {
    return FirebaseFirestore.instance
        .collection('Product')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc)=> Product.fromSnapshot(doc)).toList();
    });
  }
}


// ProductController : Get data from the API
class ProductController extends GetxController {
  final products = <Product>[].obs;
  @override
  void onInit() {
    //FirestoreDB().getAllProducts();
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}



class Product {
  late String ItemName;
  late String ItemDescription;
  late String ChildAgeYear;
  late String Size;
  late String Category;
  late String Photo;
  late int Price;

  Product({
     required this.ItemName,
     required this.ItemDescription,
     required  this.ChildAgeYear,
     required this.Size,
     required this.Category,
    required this.Price,
    required this.Photo,
  });

  Product.fromJson(Map <String,dynamic>? json ){

    ItemName = json!['product Name'];
    ItemDescription = json!['product Description '];
    Price = json!['Price'];
    ChildAgeYear = json['child Age Year'];
    Size = json['product Size'];
    Category = json['product Category'];
     Photo = json['Photo'];

  }

  Map<String,dynamic> ToMap(){
    return {
      'product Name':ItemName,
      'product Description':ItemDescription,
      'Price':Price,
      'child Age Year':ChildAgeYear,
      'product Size':Size,
      'product Category':Category,
       'Photo': Photo,

    };
  }

  static Product fromSnapshot(DocumentSnapshot snap){

    Product product = Product(
      ItemName:snap['product Name'] ,
      ItemDescription : snap['product Description'],
      ChildAgeYear : snap['child Age Year'] ,
        Size :snap['product Size'] ,
      Category : snap['product Category'],
      Price :snap['Price'],
      Photo: snap['Photo'],
    );
    return product;
  }
}

class CartController extends GetxController{
   var _products = {}.obs;
   void addProduct(Product product){
    if(_products.containsKey(product)){
      _products[product] += 1;
    }else{
      _products[product] = 1;
    }
     print('====================================================');


   }
  void removeProduct(Product product){
     if(_products.containsKey(product) && _products[product]==1){
       _products.removeWhere((key, value) => key ==product );
     }else{
       _products[product]-=1;
     }
  }

  get products=> _products;
  get GetProductSubTotal => _products.entries.map((product) => product.key.Price * product.value ).toList();
  get total=> _products.entries
      .map((product) => product.key.Price * product.value )
      .toList()
      .reduce((value, element) => value + element )
      .toStringAsFixed(2);
}
class CartControllerFaveriot extends GetxController{
  var _products = {}.obs;
  void addProduct(Product product){
    if(_products.containsKey(product)){
      _products[product] += 1;
    }else{
      _products[product] = 1;
    }
    print('===================///======');
  }
  void removeProduct(Product product){
    if(_products.containsKey(product) && _products[product]==1){
      _products.removeWhere((key, value) => key ==product );
    }else{
      _products[product]-=1;
    }
  }
  get products=> _products;
}


//  Get.snackbar('Product Add to the cart ','',
// snackPosition: SnackPosition.BOTTOM,
//   duration: Duration(seconds: 2),
// ) != null;
// Get.snackbar(
//     'User 123',
//     'Successfully created',
//     snackPosition: SnackPosition.BOTTOM
// );

