import 'dart:io';

import 'package:flutter/material.dart';

TValue switchTo<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<TOptionType, TValue> branches, [
  TValue defaultValue = null,
]) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }

  return branches[selectedOption];
}

Future<void> ackAlert(BuildContext context, String message) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

bool isAndroid() => Platform.isAndroid;
bool isIOs() => Platform.isIOS;
