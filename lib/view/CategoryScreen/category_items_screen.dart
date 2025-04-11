import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';
import 'package:liquor_brooze_user/view/CategoryScreen/category_details.dart';
import 'package:liquor_brooze_user/viewmodel/category_screen_provider.dart';
import 'package:liquor_brooze_user/viewmodel/home_screen_provider.dart';
import 'package:liquor_brooze_user/viewmodel/root_screen_provider.dart';
import 'package:provider/provider.dart';

class CategoryItemsScreen extends StatefulWidget {
  const CategoryItemsScreen({super.key});

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        debugPrint(
            'My selected Index: ${context.read<RootScreenProvider>().currentScreenIndex}');
        context.read<CategoryScreenProvider>().getProductList(context
            .read<HomeScreenProvider>()
            .homeScreenCategoryItem[
                context.read<CategoryScreenProvider>().selectedIndex]
            .id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.7;
    final double itemWidth = size.width / 1.8;
    return Consumer<CategoryScreenProvider>(
        builder: (context, categoryScreenProvider, child) {
      if (categoryScreenProvider.isProdctLoaded) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        );
      } else if (categoryScreenProvider.categoryItems.isEmpty) {
        return const Center(
          child: Text(
            "No Product Found",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        );
      }
      return GridView.builder(
        itemCount: categoryScreenProvider.categoryItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryDetailsScreen(
                            productId:
                                categoryScreenProvider.categoryItems[index].id,
                          )));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      categoryScreenProvider.categoryItems[index].itemImageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),

                  /// Product Name
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      categoryScreenProvider.categoryItems[index].itemName,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Monserat',
                      ),
                    ),
                  ),

                  /// Product Description
                  Html(
                    data: categoryScreenProvider
                        .categoryItems[index].itemDescription,
                    style: {
                      "body": Style(
                          fontSize: FontSize(12),
                          color: Colors.grey[600],
                          fontFamily: 'Monserat',
                          maxLines: 2),
                    },
                  ),
                  // SizedBox(height: 0),

                  // Price Section
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "£ ${categoryScreenProvider.categoryItems[index].regulerPrice}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "£ ${categoryScreenProvider.categoryItems[index].discountPrice}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),

                  Consumer<CategoryScreenProvider>(
                      builder: (context, provider, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: provider.categoryItems[index].itemQuantity > 0
                          ? Container(
                              width: itemWidth,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  /// Decrease Quantity
                                  InkWell(
                                    onTap: () {
                                      provider.decreaseQuantity(index);
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),

                                  /// Quantity
                                  Text(
                                    provider.categoryItems[index].itemQuantity
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),

                                  /// Increase Quantity
                                  InkWell(
                                    onTap: () {
                                      provider.increaseQuantity(index);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : CommonButton(
                              width: itemWidth,
                              height: 40,
                              buttonColor: AppColor.primaryColor,
                              buttonText: 'Add to Cart',
                              onTap: () {
                                provider.addToCart(index);
                              },
                            ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
