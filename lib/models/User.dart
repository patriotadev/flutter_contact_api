import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  String email;
  int phone;

  User({this.id, this.name, this.email, this.phone});

  static Future<List<dynamic>> userList() async {
    final url = Uri.parse("http://192.168.0.156:3000/api/siswa");
    var result = await http.get(url);
    return json.decode(result.body)['data'];
  }

  static userPost(String name, String email, String phone) async {
    try {
      final url = Uri.parse("http://192.168.0.156:3000/api/siswa");
      var response = await http
          .post(url, body: {"name": name, "email": email, "phone": phone});
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  static userUpdate(String id, String name, String email, String phone) async {
    try {
      final url = Uri.parse("http://192.168.0.156:3000/api/siswa/" + id);
      var response = await http
          .put(url, body: {"name": name, "email": email, "phone": phone});
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  static userDelete(String id) async {
    try {
      final url = Uri.parse("http://192.168.0.156:3000/api/siswa/" + id);
      var response = await http.delete(url);
      print(response.body);
    } catch (e) {}
  }
}
