import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';
import 'package:liquor_brooze_user/view/CategoryScreen/category_details.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.85;
    final double itemWidth = size.width / 1.8;
    return GridView.builder(
      itemCount: 10,
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
                          productName: 'Old Monk',
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
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    "https://www.deleontequila.com/_next/image?url=%2Frecipe%2Fclassique-anejo-lifestyle.jpg&w=3840&q=75",
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),

                // Product Name
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "HOPPUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Monserat',
                    ),
                  ),
                ),

                // Product Description
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "AirDoze S40 Earbuds wit...",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontFamily: 'Monserat',
                    ),
                  ),
                ),
                SizedBox(height: 4),

                // Price Section
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "₹3,999",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "₹599",
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CommonButton(
                    width: itemWidth,
                    height: 40,
                    buttonColor: AppColor.primaryColor,
                    buttonText: 'Add to Cart',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
