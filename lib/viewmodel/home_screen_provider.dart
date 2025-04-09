import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/controller/home_controller.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_api_res_model.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_screen_category_item_model.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_screen_favorite_items.dart';

class HomeScreenProvider extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<String> _caroselLiquorItems = [];
  List<String> get caroselLiquorItems => _caroselLiquorItems;

  HomeScreenProvider() {
    getHomeData();
  }
  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  List<CategoryItem> _homeScreenCategoryItem = [];
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

  bool _isHomeScreenLoad = false;
  bool get isHomeScreenLoad => _isHomeScreenLoad;

  /// Model and API Controller
  HomeApiResModel _homeApiResModel = HomeApiResModel();
  final HomeController _homeController = HomeController();

  /// change the index with carosel slider
  void updateIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  /// get home data
  void getHomeData() async {
    _isHomeScreenLoad = true;
    notifyListeners();
    debugPrint('This API function was hit');

    _homeApiResModel = await _homeController.getHomeData();

    if (_homeApiResModel.success == true) {
      debugPrint('✅ API call successful');
      _caroselLiquorItems.clear();

      final dataList = _homeApiResModel.data;

      if (dataList != null && dataList.isNotEmpty) {
        for (var element in dataList) {
          if (element.banners != null && element.banners!.isNotEmpty) {
            _caroselLiquorItems = List.from(element.banners!);
            debugPrint('🎯 Banners fetched: $_caroselLiquorItems');
            break; // Stop after getting banners
          }
        }

        _homeScreenCategoryItem.clear();
        for (var element in dataList) {
          if (element.categories != null && element.categories!.isNotEmpty) {
            element.categories?.forEach((cat) {
              debugPrint('Category: ${cat.catagoryname}');
              _homeScreenCategoryItem.add(CategoryItem(
                id: "${cat.sId}",
                title: "${cat.catagoryname}",
                imageUrl: "${cat.image}",
              ));
            });
            debugPrint('🎯 Categories fetched: $_homeScreenCategoryItem');
            break; // Stop after getting categories
          }
        }

        if (_caroselLiquorItems.isEmpty) {
          debugPrint('⚠️ No banners found in any data item.');
        }
      } else {
        debugPrint('⚠️ Home API data list is empty.');
      }

      _isHomeScreenLoad = false;
      notifyListeners();
    } else {
      _isHomeScreenLoad = false;
      debugPrint('❌ API error: ${_homeApiResModel.message}');
      notifyListeners();
    }
  }
}
