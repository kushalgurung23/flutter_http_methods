import 'package:get/get.dart';
import 'package:second_http_methods/models/user_model.dart';
import 'package:second_http_methods/repositories/user_repository.dart';

class HomeScreenController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  RxList<User> userList = <User>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    isLoading = true.obs;
    List<User> resultData = await userRepository.getUserDetails();
    if (resultData.isNotEmpty) {
      userList.assignAll(resultData);
      isLoading(false);
    } else {
      throw Exception('User data not found');
    }
  }

  Future<Map<String, dynamic>> getPatchData({required User user}) async {
    Map<String, dynamic> data = await userRepository.patchUserDetails(user);
    if (data.isNotEmpty) {
      return data;
    } else {
      throw Exception('Patch data not found');
    }
  }

  Future<Map<String, dynamic>> getSelectedUser(User user) async {
    Map<String, dynamic> mapData =
        await userRepository.getSelectedUserDetails(user);
    if (mapData.isNotEmpty) {
      return mapData;
    } else {
      throw Exception('Selected user details not found');
    }
  }

  Future<Map<String, dynamic>> getPutData(User user) async {
    Map<String, dynamic> putData = await userRepository.putUserDetails(user);
    if (putData.isNotEmpty) {
      return putData;
    } else {
      throw Exception('Put user details not found');
    }
  }

  Future<String> getDeleteResult(User user) async {
    String deleteResult = await userRepository.deleteUserDetails(user);
    if (deleteResult.isNotEmpty) {
      return deleteResult;
    } else {
      throw Exception('Error occurred while deleting user details.');
    }
  }

  Future<String> performPostRequest(
      {required int id,
      required String name,
      required String username,
      required String email,
      required String street,
      required String suite,
      required String city,
      required String zipcode,
      required String latitude,
      required String longitude,
      required String phone,
      required String website,
      required String companyName,
      required String catchPhrase,
      required String bs}) async {
    User user = User(
        id: id,
        name: name,
        username: username,
        email: email,
        address: Address(
            street: street,
            suite: suite,
            city: city,
            geo: Geo(lat: latitude, lng: longitude),
            zipcode: zipcode),
        phone: phone,
        website: website,
        company: Company(name: companyName, catchPhrase: catchPhrase, bs: bs));
    String output = await userRepository.postUserDetails(user);
    return output;
  }
}
