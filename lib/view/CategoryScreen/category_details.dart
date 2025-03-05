import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightTextColor,
      appBar: AppBar(
        title: Text(
          productName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monserat',
          ),
        ),
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
                    'https://www.deleontequila.com/_next/image?url=%2Frecipe%2Fclassique-anejo-lifestyle.jpg&w=3840&q=75', // Replace with actual image URL
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// Product Title
              Text(
                'MUSCLEBLAZE 100% Clean Raw Whey Concentrate, Light & Clean, Easy to Digest Whey Protein (500 g, Unflavored)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserat',
                ),
              ),
              SizedBox(height: 10),

              /// Product Price
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "₹893",
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
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 14, left: 16, right: 16),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: CommonButton(
          width: double.infinity,
          buttonText: 'Add to Cart',
          buttonColor: AppColor.primaryColor,
        ),
      ),
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
