import 'package:second_http_methods/models/user_model.dart';

abstract class AbstractUserRepository {
  // GET method
  Future<List<User>> getUserDetails();

  // For selected user
  Future<Map<String, dynamic>> getSelectedUserDetails(User user);

  // POST method
  Future<String> postUserDetails(User user);

  // PATCH method
  Future<Map<String, dynamic>> patchUserDetails(User user);

  // PUT method
  Future<Map<String, dynamic>> putUserDetails(User user);

  // DELETE method
  Future<String> deleteUserDetails(User user);

}
