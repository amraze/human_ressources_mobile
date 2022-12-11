
import 'package:flutter/material.dart';

// class ListViewHome extends StatelessWidget 

// {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
//         quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
//         quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
//         quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
//         quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
//         quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),

//            ],
//     );
//   }
// }



  
  class ListViewHome extends StatefulWidget {
  const ListViewHome({super.key});

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
          PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              backgroundColor: Color(0xff2496AC),
          title:Text('Projects'),
        centerTitle: true,
    )),
    body:ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
        quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
        quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
        quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
        quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),
        quoteTemplate("hamadi","https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg"),

           ],
    ),
    );
  }

Widget quoteTemplate(String name,String imagUrl) {
    return Card(child:ListTile( title: Text(name),
     leading: CircleAvatar(backgroundImage:
      NetworkImage(imagUrl)),
    //  trailing: Icon(Icons.arrow_forward), 
     trailing: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/ProfilUser');
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
  }  
 
    
   
