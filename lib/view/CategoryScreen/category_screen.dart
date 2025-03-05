import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/view/CategoryScreen/category_items_screen.dart';
import 'package:liquor_brooze_user/viewmodel/category_screen_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryScreenProvider = Provider.of<CategoryScreenProvider>(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 4, right: 4),
            decoration: BoxDecoration(
              color: AppColor.lightTextColor,
              boxShadow: [
                BoxShadow(
                  color: AppColor.darkTextColor.withAlpha(50),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  categoryScreenProvider.categoryScreenCategoryItem.length,
                  (index) {
                    final item = categoryScreenProvider
                        .categoryScreenCategoryItem[index];
                    return InkWell(
                      onTap: () {
                        categoryScreenProvider.setSelectedIndex(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: categoryScreenProvider.selectedIndex == index
                              ? Colors.white // Highlight selected
                              : Colors.transparent,
                          border: Border(
                            left: BorderSide(
                              color:
                                  categoryScreenProvider.selectedIndex == index
                                      ? Colors.red // Indicator for selection
                                      : Colors.transparent,
                              width: 4,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item.imageUrl,
                                height: 60,
                                width: 80,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported,
                                        size: 50),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserat',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: CategoryItemsScreen(),
        ),
      ],
    );
  }
}
