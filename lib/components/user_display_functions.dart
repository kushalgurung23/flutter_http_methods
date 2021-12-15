import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showUserDefaultDialog(
    {required Map<String, dynamic> mapValue,
    required String title,
    required Color backgroundColor,
    required TextStyle titleStyle,
    required TextStyle middleTextStyle,
    required Color confirmTextColor,
    required Color buttonColor}) {
  return Get.defaultDialog(
      onConfirm: () {
        Get.back();
      },
      title: title,
      backgroundColor: backgroundColor,
      titleStyle: titleStyle,
      textConfirm: "Confirm",
      confirmTextColor: confirmTextColor,
      buttonColor: buttonColor,
      barrierDismissible: false,
      radius: 20,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ID: " + mapValue['id'].toString(), style: middleTextStyle),
          Text("Name: " + mapValue['name'].toString(), style: middleTextStyle),
          Text("Username: " + mapValue['username'].toString(),
              style: middleTextStyle),
          Text("Email: " + (mapValue['email'] ?? "Empty"),
              style: middleTextStyle),
          Text("Street address: " + (mapValue['address']?['street'] ?? "Empty"),
              style: middleTextStyle),
          Text("Suite: " + (mapValue['address']?['suite'] ?? "Empty"),
              style: middleTextStyle),
          Text("City: " + (mapValue['address']?['city'] ?? "Empty"),
              style: middleTextStyle),
          Text("Phone: " + (mapValue['phone'] ?? "Empty"),
              style: middleTextStyle),
        ],
      ));
}

SnackbarController showUserSnackBar(
    {required String title,
    required String text,
    required Color backgroundColor, required Color colorText}) {
  return Get.snackbar(title, text,
      duration: const Duration(seconds: 2), backgroundColor: backgroundColor,
  colorText: colorText);
}
