import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../utils/commons.dart';
import '../utils/oru_colors.dart';
import '../view_models/product_view_models.dart';
import 'global_widgets.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductViewModel>();

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OruText(
              text: 'Filters',
              fontColor: OruColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            horizontalMargin4,
            OruText(
              text: 'Clear Filter',
              fontColor: OruColors.red,
              fontWeight: FontWeight.w600,
              textDecoration: TextDecoration.underline,
              fontSize: 16,
              decorationColor: OruColors.red,
            ),
          ],
        ),
        verticalMargin16,
        Column(
          children: [
            data.isFilterLoading
                ? const CircularProgressIndicator()
                : data.filterApiResponse?.erroMsg != null
                    ? OruText(text: data.filterApiResponse?.erroMsg ?? '')
                    : Column(
                        children: [
                          FiltersWidget(
                            filtersLength: data.filterApiResponse!.filterModel!
                                .filters!.make!.length,
                            filterText: data
                                .filterApiResponse!.filterModel!.filters!.make!,
                            title: 'Brand',
                          ),
                          verticalMargin16,
                          FiltersWidget(
                            filtersLength: data.filterApiResponse!.filterModel!
                                .filters!.condition!.length,
                            filterText: data.filterApiResponse!.filterModel!
                                .filters!.condition!,
                            title: 'Condition',
                          ),
                          verticalMargin16,
                          FiltersWidget(
                            filtersLength: data.filterApiResponse!.filterModel!
                                .filters!.storage!.length,
                            filterText: data.filterApiResponse!.filterModel!
                                .filters!.storage!,
                            title: 'Storage',
                          ),
                          verticalMargin16,
                          FiltersWidget(
                            filtersLength: data.filterApiResponse!.filterModel!
                                .filters!.ram!.length,
                            filterText: data
                                .filterApiResponse!.filterModel!.filters!.ram!,
                            title: 'Ram',
                          ),
                          verticalMargin24,
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: OruColors.appBar,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: const OruText(
                                    text: 'Apply Filter',
                                    fontColor: OruColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
          ],
        )
      ],
    );
  }
}
