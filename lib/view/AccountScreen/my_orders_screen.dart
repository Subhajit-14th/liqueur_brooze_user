import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightTextColor,
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(
            color: AppColor.darkTextColor,
            fontSize: 20,
            fontFamily: 'Monserat',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: 16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    'https://www.boat-lifestyle.com/cdn/shop/files/c2386af9-4349-432f-8ba5-2b6aa06025c8_c08ea0f4-1ee7-4ba4-ac55-2eb28dc58c99_600x.png?v=1698231774',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered on Nov 22, 2024',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'boAt Airdopes 161 ANC w/ Active Noise Cancellation',
                        style: const TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
