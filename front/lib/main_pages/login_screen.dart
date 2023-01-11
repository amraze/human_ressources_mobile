import 'package:flutter/material.dart';
import '../utils/profile_api.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailInput = TextEditingController();
    TextEditingController passwordInput = TextEditingController();
    return Material(
      child: Container(
        padding: const EdgeInsets.all(60),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xff373447), Color(0xff1F1E2B)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 120,
              width: 120,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Welcome to ',
                    style: TextStyle(
                        color: Color(0xffD3D3D3),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'SJE',
                    style: TextStyle(
                        color: Color(0xffD3D3D3),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ]),
            const SizedBox(
              height: 44.0,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //EMAIL BOX INPUT
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: emailInput,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff2496AC), width: 4.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff2496AC), width: 4.0)),
                          contentPadding: const EdgeInsets.all(15),
                          filled: true,
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Color(0xffD3D3D3),
                              fontWeight: FontWeight.w300,
                              fontSize: 20.0),
                          prefixIcon:
                              const Icon(Icons.mail, color: Color(0xff2496AC)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    //EMPTY BOX
                    const SizedBox(
                      height: 20,
                    ),

                    //PASSWORD BOX INPUT
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordInput,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff2496AC), width: 4.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                color: Color(0xff2496AC),
                                width: 4.0,
                              )),
                          contentPadding: const EdgeInsets.all(15),
                          filled: true,
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Color(0xffD3D3D3),
                              fontWeight: FontWeight.w300,
                              fontSize: 20.0),
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xff2496AC)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 44.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 280.0,
              height: 65,
              child: RawMaterialButton(
                fillColor: Colors.white,
                elevation: 0.0,
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    login(emailInput.text, passwordInput.text);

                    //Navigator.pushNamed(context, '/home_page');
                  }
                },
                child: const Text("SIGN IN",
                    style: TextStyle(
                      color: Color(0xff2496AC),
                      fontSize: 22.0,
                    )),
              ),
            ),
            const SizedBox(
              height: 88.0,
            ),
          ],
        ),
      ),
    );
  }
}

void login(String email, String password) async {
  try {
    var res = await ProfileApi.postLogin(email, password);
    int statusCode = res.statusCode;
    if (statusCode == 422) {
      print("invalid email format");
    } else if (statusCode == 404) {
      print("Please verify your credentials");
    } else {
      if (statusCode == 200) {
        var decodedBody = json.decode(res.body);
        var token = decodedBody['token'];
        if (token == null) {
          print("Please verify your credentials");
        } else {
          print("you're logged in !");
        }
      }
    }
  } catch (exc) {
    print(exc);
  }
}
