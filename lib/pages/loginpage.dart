import 'package:auth_buttons/auth_buttons.dart';
import 'package:catcartoon/pages/showcartoon.dart';
import 'package:catcartoon/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('image/login.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 180),
              child: const Text(
                'Catcartoon',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            formfield(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView formfield(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              child: Column(
                children: [
                  TextFormField(
                    validator: RequiredValidator(errorText: "กรุณากรอกอีเมลล์"),
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: const Text(
                        'Email',
                        style: TextStyle(fontSize: 20),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
                    controller: _password,
                    style: const TextStyle(),
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text(
                        'Password',
                        style: TextStyle(fontSize: 20),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff4c505b),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              siginWithEmail(_email.text, _password.text);
                              var route = MaterialPageRoute(
                                builder: (context) => const ShowCartoonPage(),
                              );
                              Navigator.push(context, route);
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}