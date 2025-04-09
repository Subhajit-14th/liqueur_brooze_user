import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/viewmodel/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenCategoryItems extends StatelessWidget {
  const HomeScreenCategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 1.8;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GridView.builder(
        itemCount: homeScreenProvider.homeScreenCategoryItem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  homeScreenProvider.homeScreenCategoryItem[index].imageUrl,
                  height: 60,
                  width: 80,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                homeScreenProvider.homeScreenCategoryItem[index].title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserat',
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
