import 'package:contact_api/main.dart';
import 'package:contact_api/models/User.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  final getUser;

  const UpdateUser({Key key, this.getUser}) : super(key: key);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final nameInput = TextEditingController();
  final emailInput = TextEditingController();
  final phoneInput = TextEditingController();

  updatePostButton() {
    String id = widget.getUser['_id'].toString();
    String name = nameInput.text.toString();
    String email = emailInput.text.toString();
    String phone = phoneInput.text.toString();

    // User.userPost(name, email, phone);
    User.userUpdate(id, name, email, phone);

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  getUserValue() {
    nameInput.text = widget.getUser['name'].toString();
    emailInput.text = widget.getUser['email'].toString();
    phoneInput.text = widget.getUser['phone'].toString();
  }

  @override
  void initState() {
    super.initState();
    getUserValue();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update User')),
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
                  onPressed: () => updatePostButton(), child: Text('Update'))
            ],
          )),
    );
  }
}
