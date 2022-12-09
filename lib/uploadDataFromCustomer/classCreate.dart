// class Information_Customer_Model{
//   late int id;
//   late String name;
//   late String image;
//   late double price;
//   late int quantity;
//   //  late bool isEmailVerified;
//
//
//
//   Information_Customer_Model({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.quantity,
//
//     //  required this.isEmailVerified,
//
//   });
//
//   Information_Customer_Model.fromJson(Map <String,dynamic>? json ){
//
//     id = json!['id'];
//     name = json!['name'];
//     image = json['image'];
//     price = json['price'];
//     quantity = json['quantity'];
//
//     //  isEmailVerified = json['isEmailVerified'];
//
//   }
//   //convert data to map
//   Map<String,dynamic> ToMap(){
//     return {
//       'Id':id,
//       'Name':name,
//       'Image':image,
//       'Price':price,
//       'Quantity':quantity,
//     };
//   }
// }