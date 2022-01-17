import 'package:contact_api/main.dart';
import 'package:contact_api/models/user.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final nameInput = TextEditingController();
  final emailInput = TextEditingController();
  final phoneInput = TextEditingController();

  addPostButton() {
    String name = nameInput.text;
    String email = emailInput.text;
    String phone = phoneInput.text.toString();

    User.userPost(name, email, phone);

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New User')),
      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              TextField(
                controller: nameInput,
                decoration: InputDecoration(
                    hintText: 'input name..', labelText: 'Name'),
              ),
              TextField(
                controller: emailInput,
                decoration: InputDecoration(
                    hintText: 'input email..', labelText: 'Email'),
              ),
              TextField(
                controller: phoneInput,
                decoration: InputDecoration(
                    hintText: 'input phone..', labelText: 'Phone'),
              ),
              ElevatedButton(
                  onPressed: () => addPostButton(), child: Text('Add'))
            ],
          )),
    );
  }
}
