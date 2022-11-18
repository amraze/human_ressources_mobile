import 'package:flutter/material.dart';

class projects extends StatefulWidget {
  const projects({super.key});

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  @override
  Widget build(BuildContext context) {

   return Scaffold(
    drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Mohamed Naski",
              style: TextStyle(color: Colors.black),),
              accountEmail: Text("mohamed.naski@supcom.tn",
              style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage
                    ('https://scontent.ftun10-1.fna.fbcdn.net/v/t39.30808-6/256387445_1468760843517912_6354916045760652092_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_ohc=BomqUcauA8EAX-L76wR&_nc_oc=AQkFpAwmCDnbvvY3lUQrtsLEiKnogdsyZ9rwQNXj4pvtKPZUe7HYS_PYJnW9aVnHk5E&_nc_ht=scontent.ftun10-1.fna&oh=00_AfCWvCKdU-Lo0wZeNrXttDkWbBOwdFOB8BITtXIY-eXNVQ&oe=637B4882'),
                   
              ),
              
                 
            ),
            
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("My Profile"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.insights),
              title: Text("Performance"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: 
   PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
         title:Text('Projects'),
        centerTitle: true,
    )),
    body: 
    Container(
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
            
          ]   
          ),
        ],
      ),
    ));

  }
}


