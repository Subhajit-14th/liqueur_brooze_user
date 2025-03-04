import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/model/category_screen_model/category_screen_items_model.dart';

class CategoryScreenProvider extends ChangeNotifier {
  final List<CategoryScreenItem> _categoryScreenCategoryItem = [
    CategoryScreenItem("Beer",
        "https://thumbs.dreamstime.com/b/bottles-famous-global-beer-brands-poznan-pol-mar-including-heineken-becks-bud-miller-corona-stella-artois-san-miguel-143170440.jpg"),
    CategoryScreenItem("Gin",
        "https://www.foodandwine.com/thmb/FVY-2u029aSd8w306F1dyU8PgzE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Indias-Gin-Renaissance-Takes-the-Global-Stage-FT-BLOG0824-01-bf5784977b544be8b38c25b406b77425.jpg"),
    CategoryScreenItem("Vodka",
        "https://assets.bonappetit.com/photos/663cdc3709730b874e26baad/4:3/w_4444,h_3333,c_limit/vodka-taste-test_LEDE_050824_0065_VOG_final.jpg"),
    CategoryScreenItem("Whiskey",
        "https://theflaskandbarrel.com/wp-content/uploads/2023/07/whiskey-1024x628.jpg"),
    CategoryScreenItem("Tequila",
        "https://www.deleontequila.com/_next/image?url=%2Frecipe%2Fclassique-anejo-lifestyle.jpg&w=3840&q=75"),
    CategoryScreenItem("Rum",
        "https://brewsnspirits.in/images/articles/details/cover-story-old-monk-june-july-2020.jpg"),
    CategoryScreenItem("Brandy",
        "https://prestigehaus.com/media/magefan_blog/best-budget-brandy-for-cooking-sipping-mixing-and-gifting.jpg"),
    CategoryScreenItem("Amaretto",
        "https://www.disaronno.com/wp-content/uploads/hero-disaronno-mob.jpg"),
    CategoryScreenItem("Campari",
        "https://assets.bonappetit.com/photos/5c59e88485716f2cc28c0e84/master/pass/Basically-Campari-Group.jpg"),
    CategoryScreenItem("Baileys",
        "https://bestsips.com.au/wp-content/uploads/2024/11/12/baileys-chocolate-raspberry-martinis.jpg"),
  ];
  List<CategoryScreenItem> get categoryScreenCategoryItem =>
      _categoryScreenCategoryItem;
}
