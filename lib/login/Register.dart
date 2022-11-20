import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_project_software/Store.dart';
import 'package:flutter_application_project_software/components.dart';

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
    return Scaffold(
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
                  SizedBox(
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
                  SizedBox(
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
                  SizedBox(
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
                  SizedBox(
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
                      }
                    },
                  ),
                  SizedBox(
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
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    isPassword: isPassword2,
                    controller: ConfirmPassworconroller,
                    icon: Icons.lock,
                    lable: 'Confirm Password',
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm password must be not empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ButtonLogin(
                      width: double.infinity,
                      text: 'Register',
                      height: 40,
                      isUpperCase: true,
                      function: () {
                        if (FormKey2.currentState!.validate()) {
                          openMyPage();
                        }
                        ;
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
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
