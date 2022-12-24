import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/login/user_model_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloks/Cubit_Register.dart';
import '../bloks/States_Register.dart';
import '../components.dart';
import 'Store.dart';

class Register_page extends StatefulWidget {
  const Register_page({super.key});

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  var Nameconroller = TextEditingController();
  var Emailconroller = TextEditingController();

  var Mobileconroller = TextEditingController();
  var ChildAgeconroller = TextEditingController();

  var Passwordconroller = TextEditingController();
  var ConfirmPassworconroller = TextEditingController();

  var FormKey2 = GlobalKey<FormState>();

  bool isPassword2 = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SoicalRegisterCubits(),

      child: BlocConsumer<SoicalRegisterCubits,SoicalRegisterStates>(
          listener: (context,state){
            if(state is SoicalCreteUserSuccessStates){
              openMyPage();
            }
          },
          builder: (context,state)=> Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: FormKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        TextButtom(
                          controller: Nameconroller,
                          icon: Icons.child_care,
                          lable: 'Name',
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
                          lable: 'Phone Number',
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
                          lable: 'Age',
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
                          controller: Emailconroller,
                          icon: Icons.email_outlined,
                          lable: 'Email',
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            } else if (!value.contains("@")) {
                              return 'Must enter email please';
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
                          lable: 'Password',
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
                        ConditionalBuilder(
                          condition: state is! SoicalRegisterLoadingStates,
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                          builder:(context)=>ButtonLogin(
                            
                              width: double.infinity,
                              text: 'Register',
                              height: 40,
                              isUpperCase: true,
                              function: () {
                                if (FormKey2.currentState!.validate()) {
                                  SoicalRegisterCubits.get(context).userRegister(
                                      name: Nameconroller.text,
                                      phoneNumber: Mobileconroller.text,
                                      age: ChildAgeconroller.text,
                                      email: Emailconroller.text,
                                      password: Passwordconroller.text,
                                 //   isEmailVerified: false
                                       );
                                //   if(Value_Set_Redister == 'Set_Redister_successed' && error_Register =='' ){
                                //      openMyPage();
                                //    //  }
                                //   if(errorRegister == null){
                                //     return openMyPage();
                                //   }
                                };

                              }),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

      ),
    );
  }

  void openMyPage() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Store_page(),
      ),
    );
  }
}
