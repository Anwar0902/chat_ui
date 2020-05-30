import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/models/message_model.dart';
import 'package:mychatapp/widgets/messageScreen.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
          child: ListView.builder(
              itemCount: chats.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MessageScreen(user: chats[index].sender)
                    ));
                  },
                  child: Container(
                    color: chats[index].unread ?  Color(0xFFFFEFEE) : Colors.white10,
                    margin: EdgeInsets.only(right: 20.0, top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(chats[index].sender.imageUrl),
                              radius: 35.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(chats[index].sender.name, style: TextStyle(color: Colors.blueGrey, fontSize: 15.0, fontWeight: FontWeight.bold)),
                                Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Text(chats[index].text, style: TextStyle(color: Colors.blueGrey, fontSize: 15.0, fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(chats[index].time, style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 5.0,),
                            chats[index].unread ? Container(
                              width: 45.0,
                              height: 24.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              child: Text('NEW', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                            )
                                    : Text('')
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
