import 'package:designer_patters_factorymethod/factories/android_dialog.dart';
import 'package:designer_patters_factorymethod/factories/dialog_action.dart';
import 'package:designer_patters_factorymethod/factories/idialog.dart';
import 'package:designer_patters_factorymethod/factories/ios_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class DialogFactory {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T> showAlertDialog<T>(
    {
    Widget title,
    Widget content,
    List<DialogAction> actions,
    bool forceAndroid=false,
    bool forceIos=false
  }) {
    Idialog dialogData;

    if ((Platform.isIOS || forceIos) && !forceAndroid) {
      dialogData = IosDialog();
    } else if((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidDialog();
    } else{
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: navigatorKey.currentState.overlay.context,
      builder: (context) => dialogData.create(
        context,
        title ?? Text('Não informado'),
        content ?? Text('Não informado'),
        actions ?? [],
      ),
    );
  }
}
