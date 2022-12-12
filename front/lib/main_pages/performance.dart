import 'package:flutter/material.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  PerformanceState createState() => PerformanceState();
}

class PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF353445),
                Color(0xFF1b1d2a),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            Center(
                child: AppBar(
              leading: BackButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            )),
            const SizedBox(height: 100),
            const Text(
              'Performance',
              style: TextStyle(
                  color: Color(0xffD3D3D3),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
