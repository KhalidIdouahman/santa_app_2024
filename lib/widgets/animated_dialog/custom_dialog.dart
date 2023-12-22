import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

typedef CallbackAction = void Function();

AwesomeDialog buildAnimatedDialog({
  required BuildContext context,
  required CallbackAction onOkPressed,
  required CallbackAction onCancelPressed,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.topSlide,
    headerAnimationLoop: true,
    title: 'Feature Locked',
    desc: 'Do you want to unlock this Feature.',
    btnCancelOnPress: onCancelPressed,
    btnOkText: "Unlock",
    btnOkOnPress: onOkPressed,
  )..show();
}
