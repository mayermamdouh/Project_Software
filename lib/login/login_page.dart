import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_project_software/Store.dart';
import 'package:flutter_application_project_software/components.dart';
import 'package:flutter_application_project_software/login/Register.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Login',
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
                    controller: emailcontroller,
                    icon: Icons.email,
                    lable: 'Email',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Eamil must be not empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    isPassword: isPassword,
                    suffix:
                        isPassword ? Icons.visibility_off : Icons.visibility,
                    suffixpress: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    controller: passwordcontroller,
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
                    height: 25.0,
                  ),
                  ButtonLogin(
                      width: double.infinity,
                      text: 'login',
                      height: 40,
                      isUpperCase: true,
                      function: () {
                        if (FormKey.currentState!.validate()) {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                          openMyPage();
                        }
                        ;
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register_page()),
                          );
                        },
                        child: Text('Register Now'),
                      ),
                    ],
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
