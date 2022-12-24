
//   FirebaseFirestore.instance
//       .collection('UserRegister')
//       .doc(uId)
//       .update({
//   "Name":Nameconroller.text,
//   "PhoneNumber":Mobileconroller.text,
//   "Age":ChildAgeconroller.text,
//   "Password": Passwordconroller.text,
//   }).then((result){
//   print("user Update");
//   }).catchError((onError){
//   print(onError.toString());
//   });
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components.dart';
import '../../bloks/CacheHelper.dart';


class page4 extends StatefulWidget {
  const page4({Key? key}) : super(key: key);


  @override
  State<page4> createState() => _page0State();
}


class _page0State extends State<page4> {
  bool istrue = false;
  bool istrue2 = false;
  bool _loading = false;
  var Nameconroller = TextEditingController();
  var Emailconroller = TextEditingController();
  var Mobileconroller = TextEditingController();
  var ChildAgeconroller = TextEditingController();
  var Passwordconroller = TextEditingController();
  var ConfirmPassworconroller = TextEditingController();
  var FormKey3 = GlobalKey<FormState>();
  var KeyFormData = GlobalKey<FormState>();
  bool isPassword2 = true;
  String uId = CacheHelper.getData(key: 'uId');


  @override
  void initState() {
    print("initState Called");
    super.initState();

    //KeyFormData.currentContext;

    // getUserDataIndividal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child:Icon(Icons.person,
                        size: 100,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                    SizedBox(height: 20,),
                     Container(
                       width: double.infinity,
                       child: Card(
                         color: Colors.blue,
                         elevation: 5,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Name: $userName ',
                                 style: const TextStyle(
                                     fontSize: 17,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text('Phone: $userPhone ',
                                 style: const TextStyle(
                                     fontSize: 17,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text('Age: $userAge ',
                                 style:const TextStyle(
                                     fontSize: 17,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text('Email:  $userEmail',
                                 style:const TextStyle(
                                     fontSize: 17,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               SizedBox(height: 10,),
                             ],
                           ),
                         ),
                       ),
                     ),
                    SizedBox(height: 20,),
                    Center(
                      child: ButtonLogin(
                        color: Colors.blue,
                        width: 200,
                        height: 40,
                        text: 'Edit Profile',
                        function: () {
                          setState(() {
                            istrue = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                     Center(
                      child: istrue2 ?  const Text('Update Profile successful !',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:15 ,
                      ),)
                      :  Container() ,
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: istrue? FormEdit(): Container() ,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }



  Widget FormEdit()=>  Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),

    ),
    //clipBehavior: Cl,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(

          key: FormKey3,
          child:  Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 40.0,
              ),
              TextButtom(
                controller: Nameconroller,
                icon: Icons.child_care,
                lable: 'New Name',
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name must be not empty';
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButtom(
                controller: Mobileconroller,
                icon: Icons.phone,
                lable: 'New Phone Number',
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone Number must be not empty';
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButtom(
                controller: ChildAgeconroller,
                icon: Icons.calendar_view_day_rounded,
                lable: 'New Age',
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age must be not empty';
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),


              TextButtom(
                isPassword: isPassword2,
                suffix:
                isPassword2 ? Icons.visibility_off : Icons.visibility,
                suffixpress: () {
                  setState(() {
                    isPassword2 = !isPassword2;
                  });
                },
                controller: Passwordconroller,
                icon: Icons.lock,
                lable: 'New Password',
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must be not empty';
                  }
                  if(value.length < 8){
                    return "Password must be at least 8 characters long";
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButtom(
                isPassword: isPassword2,
                controller: ConfirmPassworconroller,
                icon: Icons.lock,
                lable: 'Confirm Password',
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty ) {
                    return 'Confirm password must be not empty ';
                  }
                  if(value !=Passwordconroller.text ){
                    return 'Confirm Password Not Match Password ';
                  }
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              Center(
                child: ButtonLogin(
                  width: 200,
                  height: 40,
                  text: 'save change',
                  function: () {
                    setState(() {
                      istrue = false;
                      istrue2 = true;
                     if (FormKey3.currentState!.validate()) {
                         FirebaseFirestore.instance
                           .collection('UserRegister')
                           .doc(uId)
                           .update({
                         "Name":Nameconroller.text,
                         "PhoneNumber":Mobileconroller.text,
                         "Age":ChildAgeconroller.text,
                         "Password": Passwordconroller.text,
                       }).then((result){
                         print("user Update");
                       }).catchError((onError){
                         print(onError.toString());
                       });
                     }
                    });
                  },
                ),
              ),


            ],
          )
      ),
    ),
  );



  // Future<void> _getUserName() async {
  //   FirebaseFirestore.instance
  //       .collection('UserRegister')
  //       .doc((uId)).get()
  //       .then((value) {
  //         print(value.toString());
  //     // setState(() {
  //     //   _userName = value.data.Name.toString();
  //     // });
  //   });
  // }



        }
