import 'package:contact_api/main.dart';
import 'package:contact_api/models/User.dart';
import 'package:contact_api/pages/UpdateUser.dart';
import 'package:flutter/material.dart';

class DetailUser extends StatefulWidget {
  final getUser;

  const DetailUser({Key key, this.getUser}) : super(key: key);

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.getUser['name'])),
      body: Container(
        color: Colors.grey[200],
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200], spreadRadius: 2, blurRadius: 7)
                ]),
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Center(child: Text(widget.getUser['name'])),
                            Center(child: Text(widget.getUser['email'])),
                            Center(
                                child:
                                    Text(widget.getUser['phone'].toString())),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  color: Colors.grey[200],
                                  child: IconButton(
                                      // onPressed: deleteDetailUser(
                                      //     context, widget.getUser['_id']),
                                      onPressed: () => {
                                            User.userDelete(
                                                widget.getUser['_id']),
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyApp()))
                                          },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))),
                              Container(
                                  color: Colors.grey[200],
                                  child: IconButton(
                                      onPressed: () => {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateUser(
                                                            getUser: widget
                                                                .getUser)))
                                          },
                                      icon:
                                          Icon(Icons.edit, color: Colors.grey)))
                            ],
                          ))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
