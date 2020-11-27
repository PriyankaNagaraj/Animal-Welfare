import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CommonAlertDialog extends StatelessWidget {
  const CommonAlertDialog({
    Key key,
    @required this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  final Widget title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        title: title, content: content, actions: actions);
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: Text(title),
      actions: <Widget>[
        PlatformDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        )
      ],
    );
  }
}
