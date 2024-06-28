import 'package:flutter/material.dart';

class Constants {
  static RegExp emailValidationRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Deletion'),
              content: const Text('Are you sure you want to delete this item?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(false); // User cancelled the action
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(true); // User confirmed the action
                  },
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        ) ??
        false; // Return false if the dialog is dismissed without a selection
  }
}
