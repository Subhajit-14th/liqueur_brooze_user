import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';
import 'package:liquor_brooze_user/viewmodel/category_screen_provider.dart';
import 'package:liquor_brooze_user/viewmodel/root_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<CategoryScreenProvider>()
          .getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 1.8;
    final productDetails = Provider.of<CategoryScreenProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.lightTextColor,
      appBar: AppBar(
        title: Text(
          "${productDetails.productDetailsApiResModel.product?.productName}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monserat',
          ),
        ),
        // actions: [
        //   context
        //               .watch<CategoryScreenProvider>()
        //               .categoryItems[widget.index]
        //               .itemQuantity >
        //           0
        //       ? Stack(
        //           children: [
        //             IconButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //                 context.read<RootScreenProvider>().setScreenIndex(3);
        //               },
        //               icon: Icon(Icons.shopping_cart_outlined),
        //             ),
        //             if (context
        //                     .read<CategoryScreenProvider>()
        //                     .totalCartQuantity >
        //                 0)
        //               Positioned(
        //                 right: 8,
        //                 top: 0,
        //                 child: badges.Badge(
        //                   badgeContent: Text(
        //                     context
        //                         .read<CategoryScreenProvider>()
        //                         .totalCartQuantity
        //                         .toString(),
        //                     style: TextStyle(
        //                         color: AppColor.lightTextColor, fontSize: 12),
        //                   ),
        //                   badgeStyle: badges.BadgeStyle(
        //                     badgeColor: AppColor.primaryColor,
        //                   ),
        //                 ),
        //               ),
        //           ],
        //         )
        //       : SizedBox(),
        // ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    "${productDetails.productDetailsApiResModel.product?.productImage}", // Replace with actual image URL
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// Product Title
              Text(
                '${productDetails.productDetailsApiResModel.product?.productName}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserat',
                ),
              ),
              SizedBox(height: 10),

              /// Product Description
              Html(
                data: productDetails
                    .productDetailsApiResModel.product?.description,
                style: {
                  "body": Style(
                    fontSize: FontSize(14),
                    color: Colors.grey[800],
                    fontFamily: 'Monserat',
                    maxLines: 2,
                  ),
                },
              ),

              /// Product Price
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "£ ${productDetails.productDetailsApiResModel.product?.regulerPrice}",
                  style: TextStyle(
                    color: AppColor.darkTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// Product Quantity
              Text(
                "Quantity: ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserat',
                ),
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  ChoiceChip(
                    label: Text(
                      '180ml',
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserat',
                      ),
                    ),
                    selected: true,
                    backgroundColor: AppColor.lightTextColor,
                    elevation: 5,
                    selectedColor: AppColor.lightTextColor,
                  ),
                  SizedBox(width: 5),
                  ChoiceChip(
                    label: Text(
                      '375ml',
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserat',
                      ),
                    ),
                    selected: false,
                  ),
                  SizedBox(width: 5),
                  ChoiceChip(
                    label: Text(
                      '500ml',
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserat',
                      ),
                    ),
                    selected: false,
                  ),
                  SizedBox(width: 5),
                  ChoiceChip(
                    label: Text(
                      '750ml',
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserat',
                      ),
                    ),
                    selected: false,
                  ),
                ],
              ),
              SizedBox(height: 10),

              /// Address Details
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.lightTextColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.darkTextColor.withAlpha(50),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Deliver to: ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Monserat',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Subhajit, 700102',
                            style: TextStyle(
                              color: AppColor.darkTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Barshana apartment, Nayapatti, chow...",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Monserat',
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping_rounded,
                          color: AppColor.secondaryColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "FREE Delivery ₹40 • Delivery in 2 Days, Friday",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monserat',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    RichText(
                      text: const TextSpan(
                        text: "If ordered within ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Monserat',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '01h 35m 14s',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              /// Policy Details
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // No Returns Allowed
                    _buildIconText(
                      iconPath:
                          'https://cdn-icons-png.flaticon.com/512/18274/18274963.png',
                      text: 'No Returns Allowed',
                    ),
                    // Cash On Delivery
                    _buildIconText(
                      iconPath:
                          'https://cdn-icons-png.flaticon.com/512/9198/9198191.png',
                      text: 'Cash On Delivery available',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              /// Highlights Section
              const Text(
                'Highlights',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserat',
                ),
              ),
              const SizedBox(height: 8),
              const HighlightItem(text: 'Form: Powder'),
              const HighlightItem(text: 'Vegetarian'),
              const HighlightItem(text: 'Usage Post-workout'),
              const HighlightItem(text: 'Protein Type: Whey Protein'),
              const HighlightItem(
                  text: 'Dietary Preference: No Artificial Flavor, Sugar Free'),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<CategoryScreenProvider>(
          builder: (context, categoryProvider, child) {
        return
            // categoryProvider.categoryItems[widget.index].itemQuantity > 0
            //     ? Container(
            //         width: itemWidth,
            //         height: 50,
            //         margin: EdgeInsets.only(bottom: 14, left: 16, right: 16),
            //         decoration: BoxDecoration(
            //           color: AppColor.primaryColor,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             /// Decrease Quantity
            //             InkWell(
            //               onTap: () {
            //                 categoryProvider.decreaseQuantity(widget.index);
            //               },
            //               child: Icon(
            //                 Icons.remove,
            //                 color: Colors.white,
            //               ),
            //             ),

            //             /// Quantity
            //             Text(
            //               categoryProvider.categoryItems[widget.index].itemQuantity
            //                   .toString(),
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 16,
            //               ),
            //             ),

            //             /// Increase Quantity
            //             InkWell(
            //               onTap: () {
            //                 categoryProvider.increaseQuantity(widget.index);
            //               },
            //               child: Icon(
            //                 Icons.add,
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //     :
            Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 14, left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: CommonButton(
            width: double.infinity,
            buttonText: 'Add to Cart',
            buttonColor: AppColor.primaryColor,
            onTap: () {
              // categoryProvider.addToCart(widget.index);
            },
          ),
        );
      }),
    );
  }

  Widget _buildIconText({required String iconPath, required String text}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          iconPath,
          width: 40, // Adjust size as needed
          height: 40,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}

class HighlightItem extends StatelessWidget {
  final String text;
  const HighlightItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Monserat',
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Monserat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
