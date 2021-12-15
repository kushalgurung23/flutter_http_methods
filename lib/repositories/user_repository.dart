import 'dart:convert';
import 'package:second_http_methods/models/user_model.dart';
import 'package:second_http_methods/repositories/abs_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository implements AbstractUserRepository {
  String urlAddress = "https://jsonplaceholder.typicode.com/users";

  // GET: Receive data from API
  @override
  Future<List<User>> getUserDetails() async {
    List<User> user = [];
    var url = Uri.parse(urlAddress);
    var response = await http.get(url);
    String jsonData = response.body;
    // userFromJson will return List of User
    user = userFromJson(jsonData);
    return user;
  }

  @override
  Future<Map<String, dynamic>> getSelectedUserDetails(User user) async {
    Map<String, dynamic> finalResult = {};
    var url = Uri.parse('$urlAddress/${user.id}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      finalResult = jsonDecode(response.body);
      return finalResult;
    } else {
      throw Exception('Selected user data not found.');
    }
  }

  // PATCH: Modify passed variables only and leave other values as it is.
  @override
  Future<Map<String, dynamic>> patchUserDetails(User user) async {
    late Map<String, dynamic> patchedMap;
    var url = Uri.parse('$urlAddress/${user.id}');
    await http.patch(url,
        body: {'name': 'Kushal Gurung', 'username': 'ksl.23'}).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      patchedMap = result;
    });
    return patchedMap;
  }

  // PUT: Modify passed variables only and assign other values to null or default.
  @override
  Future<Map<String, dynamic>> putUserDetails(User user) async {
    Map<String, dynamic> putMap = {};
    var url = Uri.parse('$urlAddress/${user.id}');
    await http.put(url,
        body: {'name': 'Kushal Gurung', 'username': 'ksl.23'}).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      putMap = result;
    });
    return putMap;
  }

  @override
  Future<String> deleteUserDetails(User user) async {
    var url = Uri.parse('$urlAddress/${user.id}');
    String deleted = "Error occurred while deleting user.";
    await http.delete(url).then((response) {
      if (jsonDecode(response.body).isEmpty) {
        return (deleted = "User has been deleted.");
      }
    });
    return deleted;
  }

  @override
  Future<String> postUserDetails(User user) async {
    Map<String, dynamic> newUser = user.toJson();
    var url = Uri.parse(urlAddress);
    final response = await http.post(url, body: newUser);

    // 201 status code: One or more resources have been successfully created on server.
    if (response.statusCode == 201) {
      return 'New user details posted successfully.';
    } else {
      throw Exception('Error while integrating post http method.');
    }
  }
}
