import 'package:flutter/material.dart';

class projects extends StatefulWidget {
  const projects({super.key});

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  @override
  Widget build(BuildContext context) {
   return Container(
      padding: const EdgeInsets.all(60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
          Color(0xff373447), Color(0xff1F1E2B)
        ]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
            'Welcome to ',
            style: TextStyle(color: Color(0xffD3D3D3), fontSize: 28.0, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center, 
            ),
            Text(
            'projects t nzid nchoufha 5ater kif tamel route aadi bel materialapp ygeneri f erreur ',
            style: TextStyle(color: Color(0xffD3D3D3), fontSize: 28.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, 
            ),
          ]   
          ),
        ],
      ),
    );

  }
}