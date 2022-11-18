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
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            buildImageInteractionCard(),
          ]   
          ),
        ],
      ),
    ));
  }
}

Widget buildQuoteCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [  
        Ink.image(
          image: NetworkImage(
            'https://scontent.ftun10-1.fna.fbcdn.net/v/t39.30808-6/256387445_1468760843517912_6354916045760652092_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_ohc=BomqUcauA8EAX-L76wR&_nc_oc=AQkFpAwmCDnbvvY3lUQrtsLEiKnogdsyZ9rwQNXj4pvtKPZUe7HYS_PYJnW9aVnHk5E&_nc_ht=scontent.ftun10-1.fna&oh=00_AfCWvCKdU-Lo0wZeNrXttDkWbBOwdFOB8BITtXIY-eXNVQ&oe=637B4882'
          ),
          height: 240,
          fit: BoxFit.cover,

        )
         
      ],
    ),
);


 Widget buildImageInteractionCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: new InkWell(
          onTap: () {
        print("tapped");
        },
        child: Column(
          
          children: [
            Stack(
              
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
                  ),
                  height: 190,
                  width: 360,
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
                'Project 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff2496AC) ),
              ),
            ),
          ],
        ),
        )
        
      );
