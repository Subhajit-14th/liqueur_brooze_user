import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_button.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_passwordfield.dart';
import 'package:liquor_brooze_user/utlis/widgets/common_textfield.dart';
import 'package:liquor_brooze_user/view/Authentication/register_screen.dart';
import 'package:liquor_brooze_user/viewmodel/authentication_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'assets/app_logo/app_logo.png',
              height: 200,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            const Text(
              'Welcome to Liquor Brooze',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserat',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please login to continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserat',
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CommonTextField(
                labelText: 'Email',
                hintText: 'Email',
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CommonPasswordField(
                labelText: 'Password',
                hintText: 'Password',
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CommonButton(
                width: double.infinity,
                buttonText: 'Login',
                buttonColor: AppColor.primaryColor,
                onTap: () {
                  context.read<AuthenticationProvider>().setUserLoggedIn(true);
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Don\'t have an account?'),
            const SizedBox(height: 2),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
