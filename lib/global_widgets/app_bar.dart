// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../costants/constants.dart';
import '../utils/commons.dart';
import '../utils/oru_colors.dart';
import 'oru_text.dart';

AppBar appBar({
  void Function()? onTap,
  void Function()? onTapSuffix,
  void Function()? onNotificationPressed,
  void Function(String)? onChanged,
  void Function(String?)? onSubmitted,
  TextEditingController? textEditingController,
  bool? isReadOnly,
  bool? isAutoFocus,
  bool? isSuffix,
}) {
  return AppBar(
      toolbarHeight: 80,
      backgroundColor: OruColors.appBar,
      automaticallyImplyLeading: false,
      leadingWidth: double.maxFinite,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        '$icon/menu.svg',
                        height: 34,
                      ),
                      horizontalMargin32,
                      SvgPicture.asset(
                        '$icon/logo_square.svg',
                        height: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const OruText(
                        text: 'India',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.white,
                      ),
                      SvgPicture.asset(
                        '$icon/location.svg',
                        height: 18,
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: onNotificationPressed,
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            verticalMargin4,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: OruColors.white,
              ),
              child: TextFormField(
                // textAlign: TextAlign.center,

                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,

                readOnly: isReadOnly ?? true,
                controller: textEditingController,
                onTap: onTap,
                autofocus: isAutoFocus ?? false,
                decoration: InputDecoration(
                    contentPadding: (isSuffix ?? false)
                        ? const EdgeInsets.fromLTRB(8.0, 2.0, 20.0, 14.0)
                        : const EdgeInsets.fromLTRB(0.0, 2.0, 20.0, 14.0),
                    prefixIconConstraints: const BoxConstraints(maxHeight: 16),
                    prefixIcon: (isSuffix == null || isSuffix == false)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: SvgPicture.asset(
                              '$icon/search.svg',
                              color: OruColors.appBar,
                            ),
                          )
                        : null,
                    suffixIcon: (isSuffix ?? false)
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: onTapSuffix,
                            icon: const Icon(Icons.clear_outlined),
                          )
                        : null,
                    border: InputBorder.none,
                    hintText: 'Search with make and model..',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: OruColors.black,
                    )),
              ),
            )
          ],
        ),
      ));
}
