import 'package:contact_api/models/User.dart';
import 'package:contact_api/pages/AddUser.dart';
import 'package:contact_api/pages/DetailUser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Contact API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  detailUserPage(context, user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailUser(
                  getUser: user,
                )));
  }

  addNewUser() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
          future: User.userList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                          margin: EdgeInsets.all(10),
                          child: Dismissible(
                              direction: DismissDirection.endToStart,
                              key: UniqueKey(),
                              background: Container(
                                color: Colors.red,
                                child: Center(
                                    child: Text(
                                  'Removed',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              onDismissed: (direction) => setState(() {
                                    User.userDelete(
                                        snapshot.data[index]['_id']);
                                  }),
                              child: ListTile(
                                title: Text(snapshot.data[index]['name']),
                                subtitle: Text(snapshot.data[index]['email'] +
                                    ' - ' +
                                    snapshot.data[index]['phone'].toString()),
                                onTap: () => detailUserPage(
                                    context, snapshot.data[index]),
                              )));
                    }),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }
            return Center(child: Text("Loading..."));
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            // color: Colors.white,
          ),
          backgroundColor: Colors.amber,
          onPressed: () => addNewUser()),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
