import 'package:flutter/material.dart';
import 'package:oru_phones/global_widgets/global_widgets.dart';

import '../utils/commons.dart';
import '../utils/oru_colors.dart';

class FiltersWidget extends StatelessWidget {
  final String title;
  final List<String> filterText;
  final int filtersLength;
  const FiltersWidget({
    super.key,
    required this.filtersLength,
    required this.filterText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            OruText(
              text: title,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        verticalMargin8,
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: filtersLength,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: BoxDecoration(
                  color: OruColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: OruColors.appBar.withOpacity(0.5),
                  ),
                ),
                child: OruText(
                  text: filterText[index],
                  fontWeight: FontWeight.w300,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
