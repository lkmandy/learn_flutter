// @dart=2.9

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showAlertDialog(
  BuildContext context, {
  @required String title,
  @required String content,
  @required String defaultActionText,
  String cancelActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            if (cancelActionText != null)
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelActionText),
              ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(defaultActionText),
            ),
          ]),
    );
  }
  return showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelActionText),
            ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(defaultActionText),
          ),
        ]),
  );
}
