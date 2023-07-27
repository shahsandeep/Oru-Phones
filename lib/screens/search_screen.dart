import 'package:flutter/material.dart';
import 'package:oru_phones/main.dart';

import 'package:provider/provider.dart';

import '../global_widgets/global_widgets.dart';
import '../view_models/view_models.dart';
import '../utils/utils.dart';

class SearchScreen extends StatefulWidget {
  static const String route = 'Search Screen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    Future.delayed(Duration.zero, () {
      Provider.of<SearchViewModel>(navigatorKey.currentState!.context,
              listen: false)
          .resetSearchModel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<SearchViewModel>();
    final bool condition = ((data.searchApiResponse?.searchModel != null) &&
            (data.searchApiResponse?.searchModel?.makes?.isNotEmpty ?? false) ||
        (data.searchApiResponse?.searchModel?.models?.isNotEmpty ?? false));
    final apiResponse = data.searchApiResponse?.searchModel;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: OruColors.appBar,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.arrow_circle_up,
            color: OruColors.white,
            size: 45,
          )),
      backgroundColor: OruColors.backgroundColor,
      appBar: appBar(
          onTap: () {},
          onChanged: (value) {
            if (value.isNotEmpty) {
              data.setIsSuffix(true);
              data.getAndSetFilters();
            } else {
              data.setIsSuffix(false);
            }
          },
          onTapSuffix: () {
            data.textEditingController.clear();
            data.setIsSuffix(false);
          },
          onSubmitted: (value) {
            data.getAndSetFilters();
          },
          textEditingController: data.textEditingController,
          isAutoFocus: true,
          isReadOnly: false,
          isSuffix: data.isSuffix),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Column(
            children: [
              (data.isLoading)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (condition)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OruText(
                              text: 'Brand',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontColor: OruColors.appBar.withOpacity(0.7),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: apiResponse?.makes?.length ?? 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10,
                                  ),
                                  child: OruText(
                                    text: apiResponse?.makes![index] ?? '',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                            ),
                            verticalMargin24,
                            OruText(
                              text: 'Mobile Model',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontColor: OruColors.appBar.withOpacity(0.7),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: apiResponse?.models?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10,
                                  ),
                                  child: OruText(
                                    text: apiResponse?.models![index] ?? '',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      : (data.searchApiResponse?.searchModel?.makes?.isEmpty ??
                                  false) &&
                              (data.searchApiResponse?.searchModel?.models
                                      ?.isEmpty ??
                                  false)
                          ? const OruText(
                              text: 'Found Nothing',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            )
                          : (data.searchApiResponse?.searchModel == null)
                              ? const SizedBox.shrink()
                              : OruText(
                                  text: data.searchApiResponse?.erroMsg ??
                                      'Something Went Wrong!'),
            ],
          ),
        ),
      ),
    );
  }
}
