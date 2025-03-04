import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/viewmodel/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreenCaroselSlider extends StatelessWidget {
  const HomeScreenCaroselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    return Column(
      children: [
        /// Carosel Slider
        SizedBox(
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                homeScreenProvider.updateIndex(index);
              },
            ),
            items: homeScreenProvider.caroselLiquorItems.map((item) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child:
                          Icon(Icons.broken_image, size: 50, color: Colors.red),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),

        // Indicator Positioned at the Bottom Center of the Image
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: homeScreenProvider.activeIndex,
            count: homeScreenProvider.caroselLiquorItems.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: AppColor.primaryColor,
              dotColor: Colors.black.withAlpha(50),
            ),
          ),
        ),
      ],
    );
  }
}
