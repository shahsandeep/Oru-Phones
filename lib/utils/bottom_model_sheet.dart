import 'package:flutter/material.dart';

displayBottomSheet(
  BuildContext context, {
  double? height,
  Widget? widget,
  Color? color,
  double? verticlePadding,
  double? horizontalPadding,
}) {
  return showModalBottomSheet(
    backgroundColor: color,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
    ),
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.symmetric(
        vertical: verticlePadding ?? 30,
        horizontal: horizontalPadding ?? 30,
      ),
      height: height,
      child: widget,
    ),
  );
}
