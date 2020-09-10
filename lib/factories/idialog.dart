import 'package:designer_patters_factorymethod/factories/dialog_action.dart';
import 'package:flutter/material.dart';

abstract class Idialog{
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions);
}