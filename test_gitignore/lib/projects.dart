
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
              backgroundColor: Color(0xff2496AC),
          title:Text('Projects'),
        centerTitle: true,
    )),
    body: 
    Container(
      margin: new EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(40, 40 , 35, 10),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            buildImageInteractionCard("Project 1", 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80'),
            SizedBox(height: 20,),
            buildImageInteractionCard("Project 2", 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80'),
            SizedBox(height: 20,),
            buildImageInteractionCard("Project 3", 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80'),
        ],
      ),
    ));
  }
}

 Widget buildImageInteractionCard(String projectName, String imageURL) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: new InkWell(
          onTap: () {
            
        },
        
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    imageURL,
                  ),
                  height: 140,
                  width: 350,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Click to show more details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                projectName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff2496AC) ),
              ),
            ),
          ],
        ),
        )
 
        
      );
