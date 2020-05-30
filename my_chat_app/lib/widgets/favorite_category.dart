import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/models/message_model.dart';
import 'package:mychatapp/widgets/messageScreen.dart';

class FavoriteCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Favorite Contacts", style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                fontSize: 18.0
              ),),
              IconButton(
                icon: Icon(Icons.more_horiz),
                iconSize: 30.0,
                color: Colors.blueGrey,
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 117.0,
          color: Theme.of(context).accentColor,
          child: ListView.builder(
              itemCount: favorites.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MessageScreen(user: favorites[index]),
                      ));
                    },
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(height: 8.0,),
                        Text(favorites[index].name, style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
