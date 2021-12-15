import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_http_methods/components/constants.dart';
import 'package:second_http_methods/components/user_display_functions.dart';
import 'package:second_http_methods/components/rest_buttons.dart';
import 'package:second_http_methods/controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/';
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text(
            'User Diary',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Passing hardcoded data
                  homeScreenController
                      .performPostRequest(
                          id: 11,
                          name: 'Mason Mount',
                          username: 'mmount19',
                          email: 'mason19@gmail.com',
                          street: '14th Street',
                          suite: 'Suite 190',
                          city: 'London',
                          zipcode: '45600',
                          latitude: '91.001',
                          longitude: '20.213',
                          phone: '4444444444',
                          website: 'dummy.com',
                          companyName: 'Chelsea',
                          catchPhrase: 'No idea what this is',
                          bs: 'Bikram Sambat?')
                      .then((value) => showUserSnackBar(
                          title: 'POST',
                          text: value,
                          backgroundColor: Colors.white,
                          colorText: Colors.black));
                },
                icon: const Icon(Icons.person_add))
          ],
        ),
        // put, patch, delete
        body: GetX<HomeScreenController>(
          builder: (controller) {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.userList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        child: GestureDetector(
                          onTap: () {
                            controller
                                .getSelectedUser(controller.userList[index])
                                .then(
                                  (value) => showUserDefaultDialog(
                                      mapValue: value,
                                      title: "GET",
                                      backgroundColor: Colors.deepPurpleAccent,
                                      titleStyle: kWhiteTextColor,
                                      middleTextStyle: kWhiteTextColor,
                                      buttonColor: Colors.white,
                                      confirmTextColor: Colors.black),
                                );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.black87,
                                Colors.black26,
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: size.height / 8,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        controller.userList[index].id
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      controller.userList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          overflow: TextOverflow.fade),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RestButtons(
                                            text: 'PATCH',
                                            color: Colors.yellow,
                                            onTap: () {
                                              controller
                                                  .getPatchData(
                                                      user: controller
                                                          .userList[index])
                                                  .then(
                                                    (value) =>
                                                        showUserDefaultDialog(
                                                            mapValue: value,
                                                            title: "PATCH",
                                                            backgroundColor:
                                                                Colors.yellow,
                                                            titleStyle:
                                                                kBlackTextColor,
                                                            middleTextStyle:
                                                                kBlackTextColor,
                                                            buttonColor:
                                                                Colors.black,
                                                            confirmTextColor:
                                                                Colors.yellow),
                                                  );
                                            }),
                                        RestButtons(
                                            text: 'PUT',
                                            color: Colors.orange,
                                            onTap: () {
                                              controller
                                                  .getPutData(controller
                                                      .userList[index])
                                                  .then(
                                                    (value) =>
                                                        showUserDefaultDialog(
                                                            mapValue: value,
                                                            title: "PUT",
                                                            backgroundColor:
                                                                Colors.orange,
                                                            titleStyle:
                                                                kBlackTextColor,
                                                            middleTextStyle:
                                                                kBlackTextColor,
                                                            buttonColor:
                                                                Colors.black,
                                                            confirmTextColor:
                                                                Colors.orange),
                                                  );
                                            }),
                                        RestButtons(
                                            text: 'DEL',
                                            color: Colors.red,
                                            onTap: () {
                                              controller
                                                  .getDeleteResult(controller
                                                      .userList[index])
                                                  .then((value) =>
                                                      showUserSnackBar(
                                                          title: 'DELETE',
                                                          text: value,
                                                          backgroundColor:
                                                              Colors.red,
                                                          colorText:
                                                              Colors.white));
                                            }),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
