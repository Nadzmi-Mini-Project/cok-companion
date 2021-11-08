import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage) async {
  await showDialog(
    context: context,
    builder: (context) {
      if (Platform.isAndroid) {
        return AlertDialog(
          title: const Text('An error has occurred'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      }

      return CupertinoAlertDialog(
        title: const Text('An error has occurred'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
