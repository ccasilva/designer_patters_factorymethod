import 'package:designer_patters_factorymethod/factories/dialog_action.dart';
import 'package:designer_patters_factorymethod/factories/idialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class IosDialog implements Idialog{
  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions?.map<Widget>((a) {
        return CupertinoButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      })?.toList(),
    );
  }

}