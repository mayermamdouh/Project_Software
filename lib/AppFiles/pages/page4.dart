import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../bloks/CacheHelper.dart';
import '../../components.dart';
import '../../login/user_model_function.dart';

class page4 extends StatefulWidget {
  const page4({Key? key}) : super(key: key);

  @override
  State<page4> createState() => _page0State();
}

class _page0State extends State<page4> {
  bool istrue = false;
  var Nameconroller = TextEditingController();
  var Emailconroller = TextEditingController();
  var Mobileconroller = TextEditingController();
  var ChildAgeconroller = TextEditingController();
  var Passwordconroller = TextEditingController();
  var ConfirmPassworconroller = TextEditingController();
  var FormKey3 = GlobalKey<FormState>();
  bool isPassword2 = true;

  String uId = CacheHelper.getData(key: 'uId');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(20.0),
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
                    Text('Name: ${UserData.name}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Phone:  ${UserData.phoneNumber}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Age:  ${UserData.age}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Email:  ${UserData.email}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30,),

                    Center(
                      child: ButtonLogin(
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


                    // Center(
                    //   child: ButtonLogin(
                    //     function: (){
                    //       Container(
                    //         height: 200,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         child: Column(
                    //           children:  [
                    //             Text('mayer'),
                    //           ],
                    //         ),
                    //       );
                    //         //     FirebaseFirestore.instance
                    //         //     .collection('UserRegister')
                    //         //     .doc(uId)
                    //         //     .update({
                    //         //   "name":"mayer"
                    //         // }).then((result){
                    //         //   print("user Update");
                    //         // }).catchError((onError){
                    //         //   print("not Update onError");
                    //         // });
                    //
                    //     },
                    //     text: 'Edit to Profile ',
                    //     width: 200,
                    //     height: 50,
                    //
                    //
                    //
                    //   ),
                    // ),
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
      borderRadius: BorderRadius.circular(80),

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

}
