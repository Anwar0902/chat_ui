import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/models/message_model.dart';
import 'package:mychatapp/models/user_model.dart';

class MessageScreen extends StatefulWidget {
  final User user;
  MessageScreen({ this.user });
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  final sendMessageController = TextEditingController();
  _buildMessage(message, isMe) {
    return Container(
      height: 90.0,
      margin: isMe ? EdgeInsets.only(left: 80.0, top: 8.0, bottom: 8.0) :
      EdgeInsets.only(right: 80.0, top: 8.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      decoration: BoxDecoration(
        borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)) :
            BorderRadius.only(topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time),
              SizedBox(height: 8.0,),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(message.text)),
            ],
          ),
          IconButton(
            iconSize: 30.0,
            icon: message.isLiked ? Icon(Icons.favorite, color: Theme.of(context).primaryColor,) : Icon(Icons.favorite_border),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    String userName = StringUtils.capitalize(widget.user.name);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(userName, style: TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          sendMessageController.text = "";
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)
                  )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)
                  ),
                  child: ListView.builder(
                      itemCount: messages.length,
                      physics: BouncingScrollPhysics(),
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }
                  ),
                ),
              ),
            ),
            Container(
              height: 60.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: (){},
                  ),
                  Expanded(
                    child: TextField(
                      controller: sendMessageController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Send a message...',
                        hintStyle: TextStyle(fontSize: 20.0)
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      sendMessageController.text = "";
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
