import 'package:flutter/material.dart';
import 'package:oru_phones/models/shop_by_models.dart';

const String image = 'assets/images';
const String icon = 'assets/icons';
const String baseUrl = 'https://dev2be.oruphones.com/api/v1';
final List<String> brandsImages = [
  '$image/apple.png',
  '$image/samsung.png',
  '$image/xiaomi.png',
  '$image/vivo.png',
  '$image/oneplus.png',
  '$image/motorola.png',
];

final List<ShopByModels> shopByModels = [
  const ShopByModels(
    image: '$icon/best-selling-mobiles.svg',
    name: 'BestSelling \nMobiles',
  ),
  const ShopByModels(
    image: '$icon/verified-mobils.svg',
    name: 'Verified \nDevices Only',
  ),
  const ShopByModels(
    image: '$icon/like-new.svg',
    name: 'Like New \nCondition',
  ),
  const ShopByModels(
    image: '$icon/warranty.svg',
    name: 'Phones with \nWarranty',
  ),
  const ShopByModels(
    image: '$icon/price.svg',
    name: 'Shop By \nPrice',
  ),
];

Size getSize(BuildContext context) => MediaQuery.sizeOf(context);
