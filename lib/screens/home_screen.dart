// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oru_phones/costants/constants.dart';

import 'package:oru_phones/screens/screens.dart';

import 'package:provider/provider.dart';

import '../global_widgets/global_widgets.dart';

import '../utils/utils.dart';
import '../view_models/view_models.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'Home Screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductViewModel>();
    final bool condition = ((data.apiResponse?.productModel != null) &&
        (data.apiResponse?.productModel?.listings?.isNotEmpty ?? false) &&
        (data.apiResponse?.erroMsg == null));
    final apiResponse = data.apiResponse?.productModel?.listings;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: OruColors.backgroundColor,
        appBar: appBar(onTap: () {
          Navigator.of(context).pushNamed(SearchScreen.route);
        }, onNotificationPressed: () {
          Navigator.of(context).pushNamed(NotificationScreen.route);
        }),
        body: RefreshIndicator(
          onRefresh: () async {
            return await Provider.of<ProductViewModel>(context, listen: false)
                .getAndSetFilters();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: data.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  color: OruColors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 8,
                      bottom: 2,
                    ),
                    child: OruText(
                      text: 'Buy Top Brands',
                      fontColor: OruColors.defaultTextColor.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                verticalMargin8,
                SizedBox(
                  height: 60,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: brandsImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        width: 80,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: OruColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          brandsImages[index],
                        ),
                      );
                    },
                  ),
                ),
                verticalMargin8,
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 8.5,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('$image/new_buy_sell.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: getSize(context).width,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            BuyOrSellBox(
                              buttonColor: OruColors.yellow,
                              buttonFontColor: OruColors.black,
                              buttonText: 'Sell Now +',
                              gradientColor: [
                                OruColors.sellGradient2,
                                OruColors.appBar,
                              ],
                              text: 'Sell your phone in few steps',
                              textColor: OruColors.white,
                            ),
                            BuyOrSellBox(
                              buttonColor: OruColors.appBar,
                              buttonFontColor: OruColors.white,
                              buttonText: 'Buy Now >',
                              gradientColor: [
                                OruColors.white,
                                OruColors.buyGradient1,
                              ],
                              text: 'Buy your dream phone in few steps',
                              textColor: OruColors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalMargin8,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VerticalDots(
                      isSelected: true,
                    ),
                    VerticalDots(
                      isSelected: false,
                    ),
                    VerticalDots(
                      isSelected: false,
                    ),
                    VerticalDots(
                      isSelected: false,
                    )
                  ],
                ),
                verticalMargin8,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: OruText(
                    text: 'Shop By',
                    fontColor: OruColors.defaultTextColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalMargin4,
                SizedBox(
                  height: 90,
                  width: double.maxFinite,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: shopByModels.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 70,
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: OruColors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              child:
                                  SvgPicture.asset(shopByModels[index].image),
                            ),
                            verticalMargin4,
                            OruText(
                              text: shopByModels[index].name,
                              textAlign: TextAlign.center,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                verticalMargin4,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(children: [
                              OruText(
                                text: 'Best Deals Near You',
                                fontColor:
                                    OruColors.defaultTextColor.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                              ),
                              horizontalMargin4,
                              const OruText(
                                text: 'India',
                                fontColor: OruColors.yellow,
                                fontWeight: FontWeight.w600,
                                textDecoration: TextDecoration.underline,
                                fontSize: 18,
                              ),
                            ]),
                          ),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<ProductViewModel>()
                                        .getAndSetFilters();
                                    displayBottomSheet(
                                      context,
                                      height: getSize(context).height * 0.6,
                                      widget: const FilterBottomSheet(),
                                    );
                                  },
                                  child: const OruText(
                                    text: 'Filter',
                                    fontColor: OruColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const Icon(
                                  Icons.swap_vert,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalMargin8,
                      (data.isLoading)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : (condition)
                              ? Column(
                                  children: [
                                    GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 270,
                                      ),
                                      itemCount: apiResponse?.length,
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: OruColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  verticalMargin16,
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    height: 150,
                                                    width: 150,
                                                    child: CachedNetworkImage(
                                                      maxHeightDiskCache: 250,
                                                      maxWidthDiskCache: 250,
                                                      imageUrl:
                                                          apiResponse![index]
                                                              .defaultImage!
                                                              .fullImage!,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  progress) =>
                                                              const SizedBox(
                                                                  height: 15,
                                                                  width: 15,
                                                                  child: Center(
                                                                      child:
                                                                          CircularProgressIndicator())),
                                                    ),
                                                  ),
                                                  verticalMargin8,
                                                  Row(
                                                    children: [
                                                      OruText(
                                                        text:
                                                            '₹ ${apiResponse[index].listingNumPrice.toString()}',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      OruText(
                                                        text: apiResponse[index]
                                                                .model ??
                                                            '',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ],
                                                  ),
                                                  verticalMargin4,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      OruText(
                                                        text: apiResponse[index]
                                                                .deviceStorage ??
                                                            '',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      OruText(
                                                        text:
                                                            'Condition:${apiResponse[index].deviceCondition}',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ],
                                                  ),
                                                  verticalMargin4,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      OruText(
                                                        text: apiResponse[index]
                                                                .listingLocation ??
                                                            '',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      OruText(
                                                        text: formateDate(
                                                            apiResponse[index]
                                                                    .listingDate ??
                                                                ''),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Positioned(
                                              right: 0,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.favorite_outline_sharp,
                                                  color: OruColors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    verticalMargin12,
                                    data.isLoadingMoreData
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(),
                                          )
                                        : data.isAllDataFetched
                                            ? const OruText(
                                                text: 'All Data Fetched!')
                                            : const SizedBox.shrink(),
                                    verticalMargin24,
                                  ],
                                )
                              : OruText(
                                  text: data.apiResponse?.erroMsg ??
                                      'Something Went Wrong!')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
