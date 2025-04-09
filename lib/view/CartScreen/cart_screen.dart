import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Delivery Address Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.lightTextColor,
              boxShadow: [
                BoxShadow(
                  color: AppColor.darkTextColor.withAlpha(50),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColor.secondaryColor,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deliver to: Subhajit, 700102',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserat',
                        ),
                      ),
                      const Text(
                        'Barshana apartment, Nayapatty, chow...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontFamily: 'Monserat',
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontFamily: 'Monserat',
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Product Card
          Card(
            margin: const EdgeInsets.all(12),
            color: AppColor.lightTextColor,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Product Image & Details
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://brewsnspirits.in/images/articles/details/cover-story-old-monk-june-july-2020.jpg',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Noise Colorfit Icon 2 1.8" Display Smartwatch',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserat',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.green, size: 16),
                                const Text(
                                  ' 4.1 ',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'Monserat',
                                  ),
                                ),
                                const Text(
                                  '(6,96,994)',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontFamily: 'Monserat',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Black Strap, Regular',
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Monserat',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Price, Discount, and Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '₹1,149',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Monserat',
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.green.withAlpha(50),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Text(
                              '80% OFF',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'Monserat',
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '₹5,999',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: 'Monserat',
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Delivery Information
                  Row(
                    children: [
                      const Icon(Icons.local_shipping,
                          color: Colors.black54, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: const Text(
                          'EXPRESS Delivery in 2 days, Fri - ₹40 FREE',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontFamily: 'Monserat',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text('Remove',
                              style: TextStyle(
                                color: AppColor.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserat',
                              ))),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Save for later',
                              style: TextStyle(
                                color: AppColor.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserat',
                              ))),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Buy this now',
                              style: TextStyle(
                                color: AppColor.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserat',
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 160),

          // Price Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserat',
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price (1 item)',
                      style: TextStyle(
                        fontFamily: 'Monserat',
                      ),
                    ),
                    Text(
                      '₹5,999',
                      style: TextStyle(
                        fontFamily: 'Monserat',
                      ),
                    )
                  ],
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Monserat',
                        ),
                      ),
                      Text(
                        '- ₹4,850',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Monserat',
                        ),
                      ),
                    ]),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Charges',
                        style: TextStyle(
                          fontFamily: 'Monserat',
                        ),
                      ),
                      Text(
                        '₹40 FREE',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Monserat',
                        ),
                      ),
                    ]),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserat',
                        )),
                    Text('₹1,149',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserat',
                        ))
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'You will save ₹4,850 on this order',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontFamily: 'Monserat',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          /// Buy now Buttons
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(10),
            width: double.infinity,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '5,999',
                      style: TextStyle(
                        color: AppColor.darkTextColor.withAlpha(120),
                        fontFamily: 'Monserat',
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '1,499',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.darkTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserat',
                      ),
                    ),
                  ],
                ),
                CommonButton(
                  width: 140,
                  buttonText: 'Buy Now',
                  buttonColor: AppColor.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
