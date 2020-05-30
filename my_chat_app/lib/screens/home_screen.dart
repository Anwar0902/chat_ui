import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/models/message_model.dart';
import 'package:mychatapp/widgets/category_selector.dart';
import 'package:mychatapp/widgets/chats.dart';
import 'package:mychatapp/widgets/favorite_category.dart';
import 'package:mychatapp/widgets/login.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Chats', style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text("name"),
                decoration: BoxDecoration(
                    color: Colors.blue
                ),
              ),
              Card(
                color: Theme.of(context).accentColor,
                child: ListTile(
                  title: Text('LogIn', style: TextStyle(
                      fontSize: 20.0
                  ),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ));
                  },
                ),
              )
            ],
          )
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
              ),
              child: Column(
                children: <Widget>[
                  FavoriteCategory(),
                  Chats()
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
