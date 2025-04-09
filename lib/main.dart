import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquor_brooze_user/root_screen.dart';
import 'package:liquor_brooze_user/services/services/hive_database.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/viewmodel/authentication_provider.dart';
import 'package:liquor_brooze_user/viewmodel/category_screen_provider.dart';
import 'package:liquor_brooze_user/viewmodel/home_screen_provider.dart';
import 'package:liquor_brooze_user/viewmodel/root_screen_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set the status bar color globally
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.primaryColor, // Set the desired color
    statusBarIconBrightness: Brightness.light, // Light or dark icons
  ));

  /// initialize Hive data base
  await HiveDatabase.initializeHive();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => RootScreenProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => CategoryScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquor Brooze',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      home: RootScreen(),
    );
  }
}
