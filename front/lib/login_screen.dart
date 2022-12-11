import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
            Image.asset('assets/images/logo.jpg'),
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
            SizedBox(
              width: 280,
              child: TextField(
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
                  prefixIcon: const Icon(Icons.mail, color: Color(0xff2496AC)),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            SizedBox(
              width: 280,
              child: TextField(
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
                  prefixIcon: const Icon(Icons.lock, color: Color(0xff2496AC)),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 44.0,
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
                  Navigator.pushNamed(context, '/home_page');
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
