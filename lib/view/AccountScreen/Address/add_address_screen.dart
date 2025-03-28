import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_textfield.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  String selectedAddressType = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Addresses',
          style: TextStyle(
            color: AppColor.darkTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Monserat',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextField(
              labelText: 'Full Name (Required)*',
              hintText: 'Full Name (Required)*',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            CommonTextField(
              labelText: 'Phone number (Required)*',
              hintText: 'Phone number (Required)*',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    labelText: 'Pincode (Required) *',
                    hintText: 'Pincode (Required) *',
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.secondaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                  ),
                  icon: const Icon(
                    Icons.gps_fixed,
                    color: AppColor.lightTextColor,
                  ),
                  label: const Text("Use my location"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    labelText: 'State (Required) *',
                    hintText: 'State (Required) *',
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CommonTextField(
                    labelText: 'City (Required) *',
                    hintText: 'City (Required) *',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CommonTextField(
              labelText: 'House No., Building Name (Required) *',
              hintText: 'House No., Building Name (Required) *',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 10),
            CommonTextField(
              labelText: 'Road name, Area, Colony (Required) *',
              hintText: 'Road name, Area, Colony (Required) *',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const Text(
              "Type of address",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                addressTypeButton("Home", Icons.home),
                const SizedBox(width: 10),
                addressTypeButton("Work", Icons.business),
              ],
            ),
            const SizedBox(height: 20),
            CommonButton(
              width: double.infinity,
              buttonText: 'Save Address',
              buttonColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget addressTypeButton(String label, IconData icon) {
    bool isSelected = selectedAddressType == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAddressType = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.secondaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
