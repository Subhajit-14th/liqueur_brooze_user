import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_screen_category_item_model.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_screen_favorite_items.dart';

class HomeScreenProvider extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  final List<String> _caroselLiquorItems = [
    "https://5.imimg.com/data5/SELLER/Default/2024/10/458038011/SP/IC/JD/150979004/liquor-bottle-label.jpg",
    "https://media.gettyimages.com/id/1658420093/photo/hand-of-a-man-refusing-red-wine-and-showing-car-keys-and-a-glass-of-water-on-a-table-at-home.jpg?s=612x612&w=gi&k=20&c=BK5NDgjlIVJ5FYnL6zQOKRt4pYfuXa3HTolZGyOnXaw=",
    "https://media.istockphoto.com/id/929184960/video/empty-glasses-and-alcohol-drink-on-bar-counter-in-outdoor-party-at-night.jpg?s=640x640&k=20&c=luL5Ghf9TZjBCuSweuP1F7fcWUTIHZo-9e0BFeSGRGo=",
    "https://thumbs.dreamstime.com/b/many-different-alcoholic-drinks-table-against-dark-background-213141054.jpg",
  ];
  List<String> get caroselLiquorItems => _caroselLiquorItems;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  final List<CategoryItem> _homeScreenCategoryItem = [
    CategoryItem("Beer",
        "https://thumbs.dreamstime.com/b/bottles-famous-global-beer-brands-poznan-pol-mar-including-heineken-becks-bud-miller-corona-stella-artois-san-miguel-143170440.jpg"),
    CategoryItem("Gin",
        "https://www.foodandwine.com/thmb/FVY-2u029aSd8w306F1dyU8PgzE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Indias-Gin-Renaissance-Takes-the-Global-Stage-FT-BLOG0824-01-bf5784977b544be8b38c25b406b77425.jpg"),
    CategoryItem("Vodka",
        "https://assets.bonappetit.com/photos/663cdc3709730b874e26baad/4:3/w_4444,h_3333,c_limit/vodka-taste-test_LEDE_050824_0065_VOG_final.jpg"),
    CategoryItem("Whiskey",
        "https://theflaskandbarrel.com/wp-content/uploads/2023/07/whiskey-1024x628.jpg"),
    CategoryItem("Tequila",
        "https://www.deleontequila.com/_next/image?url=%2Frecipe%2Fclassique-anejo-lifestyle.jpg&w=3840&q=75"),
    CategoryItem("Rum",
        "https://brewsnspirits.in/images/articles/details/cover-story-old-monk-june-july-2020.jpg"),
    CategoryItem("Brandy",
        "https://prestigehaus.com/media/magefan_blog/best-budget-brandy-for-cooking-sipping-mixing-and-gifting.jpg"),
    CategoryItem("Amaretto",
        "https://www.disaronno.com/wp-content/uploads/hero-disaronno-mob.jpg"),
    CategoryItem("Campari",
        "https://assets.bonappetit.com/photos/5c59e88485716f2cc28c0e84/master/pass/Basically-Campari-Group.jpg"),
    CategoryItem("Baileys",
        "https://bestsips.com.au/wp-content/uploads/2024/11/12/baileys-chocolate-raspberry-martinis.jpg"),
  ];
  List<CategoryItem> get homeScreenCategoryItem => _homeScreenCategoryItem;

  final List<HomeScreenFavoriteItems> _homeScreenFavoriteItems = [
    HomeScreenFavoriteItems(
        imageUrl:
            'https://cdn11.bigcommerce.com/s-e6b77/images/stencil/1280x1280/products/33383/48625/jack-daniels-old-no7-tennessee-sour-mash-whiskey__29510.1724507204.jpg?c=2',
        itemTitle: 'Jack Daniels'),
    HomeScreenFavoriteItems(
        imageUrl:
            'https://delhidutyfree.co.in/media/catalog/product/cache/d58eb6b6cd0b875591a577c8f7a3618e/2/0/2000227_5_dbdmumrwwamiduyi.jpg',
        itemTitle: 'Bombay Sapphire'),
    HomeScreenFavoriteItems(
        imageUrl:
            'https://kuhns.shop/cdn/shop/files/OldMonkRum-Kuhns.jpg?v=1704253243&width=3000',
        itemTitle: 'Old Monk'),
    HomeScreenFavoriteItems(
        imageUrl:
            'https://www.livcheers.com/static/content/images/liquor/LCIN00362.webp',
        itemTitle: 'Budweiser'),
    HomeScreenFavoriteItems(
        imageUrl:
            'https://www.livcheers.com/static/content/images/liquor/LCIN01350.webp',
        itemTitle: 'Magic Moment'),
    HomeScreenFavoriteItems(
        imageUrl:
            'https://images-cdn.ubuy.qa/634f110df79f4035cd5a6394-don-julio-anejo-tequila-750-ml-80.jpg',
        itemTitle: 'Don Julio'),
  ];
  List<HomeScreenFavoriteItems> get homeScreenFavoriteItems =>
      _homeScreenFavoriteItems;

  /// change the index with carosel slider
  void updateIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}
