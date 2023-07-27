import 'package:flutter/material.dart';

import '../utils/oru_colors.dart';

class VerticalDots extends StatelessWidget {
  final bool isSelected;
  const VerticalDots({
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? OruColors.appBar
            : OruColors.sellGradient2.withOpacity(0.6),
        borderRadius: BorderRadius.circular(3),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: isSelected ? 10 : 4, vertical: 4),
    );
  }
}
