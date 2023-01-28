import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:obod_shahar/utils/color.dart';

class MyUtils {
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }

  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );

  InputDecoration getInputDecoration({required String label}) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.neutral8, width: 2),
          borderRadius: BorderRadius.circular(100)),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: MyColors.neutral8, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.neutral8, width: 2),
          borderRadius: BorderRadius.circular(100)),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: label,
      focusColor: Colors.white,
      hintStyle: const TextStyle(color: MyColors.neutral7),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
