import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/viewmodel/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenFavoriteBrands extends StatelessWidget {
  const HomeScreenFavoriteBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        itemCount: homeScreenProvider.homeScreenFavoriteItems.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.lightTextColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColor.darkTextColor.withAlpha(50),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    homeScreenProvider.homeScreenFavoriteItems[index].imageUrl,
                    height: 80,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  homeScreenProvider.homeScreenFavoriteItems[index].itemTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserat',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
