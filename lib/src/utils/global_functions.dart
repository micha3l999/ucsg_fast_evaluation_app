import 'package:flutter/material.dart';

mixin GlobalFunctions {
  String radioToString(dynamic radioValue) {
    return radioValue.toString().split('.').last;
  }

  Future<void> informationDialog(BuildContext context,
      {required String title, String body = ""}) async {
    await showDialog<void>(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.grey.shade600),
            ),
          );
        });
  }
}
