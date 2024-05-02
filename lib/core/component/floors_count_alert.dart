import 'package:flutter/material.dart';
import '../helpers/snack_bars/insufficient_snack_bar.dart';

void checkFloorsValues(
    {required int? floors, required BuildContext context}) {
  if (floors == null || floors <= 1) {
    return insufficientInfoSnackBar(context);
  }
}