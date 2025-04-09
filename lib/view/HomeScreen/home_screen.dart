import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/view/HomeScreen/home_screen_carosel_slider.dart';
import 'package:liquor_brooze_user/view/HomeScreen/home_screen_category_items.dart';
import 'package:liquor_brooze_user/view/HomeScreen/home_screen_favorite_brands.dart';
import 'package:liquor_brooze_user/viewmodel/home_screen_provider.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    return context.watch<HomeScreenProvider>().isHomeScreenLoad
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),

                /// 🔍 Search Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: homeScreenProvider.searchController,
                    decoration: InputDecoration(
                      hintText: "Search content",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          homeScreenProvider.searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    homeScreenProvider.searchController.clear();
                                  },
                                )
                              : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 16),

                /// 📌 CarouselSlider is Visible
                if (homeScreenProvider.caroselLiquorItems.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: HomeScreenCaroselSlider(),
                  ),
                  SizedBox(height: 16),
                ],

                /// Merquee Text
                Container(
                  height: 25,
                  decoration: BoxDecoration(color: AppColor.darkTextColor),
                  child: Center(
                    child: Marquee(
                      text:
                          '100% GENUINE BRANDS  +  PREMIUM FINDS  +  REAL WHISKY  +',
                      style: TextStyle(
                        color: AppColor.lightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserat',
                      ),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 10,
                      velocity: 50,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: Duration(seconds: 1),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                /// Category Items
                HomeScreenCategoryItems(),

                /// Favorite brands for you
                // Padding(
                //   padding: const EdgeInsets.only(left: 16),
                //   child: Text(
                //     'Favorite brands for you',
                //     style: TextStyle(
                //       color: AppColor.darkTextColor,
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       fontFamily: 'Monserat',
                //     ),
                //   ),
                // ),
                // HomeScreenFavoriteBrands(),
                // SizedBox(height: 10),
              ],
            ),
          );
  }
}
