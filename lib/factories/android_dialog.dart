import 'package:designer_patters_factorymethod/factories/dialog_action.dart';
import 'package:designer_patters_factorymethod/factories/ios_dialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog implements IosDialog{
  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions?.map((a){
        return FlatButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      })?.toList(),
    );
  }

}