import 'package:flutter/material.dart';
import 'pages/onboarding_page.dart';
import 'pages/login_page.dart';
import 'pages/webview_page.dart';
import 'package:flutter/services.dart';

void main() {

  // Ensure that the app is in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set the status bar color to transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFC900), // Yellow
      statusBarBrightness: Brightness.light, // For iOS
    
      systemNavigationBarColor: Color(0xFFFFC900), // Light gray
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MainApp());
}

// Define custom colors as constants
class AppColors {
  static const Color primary = Color(0xFFFFC900); // Yellow
  static const Color secondary = Color(0xFFE1DFD9); // Light gray
  static const Color textDark = Color(0xFF111110); // Almost black
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GBJ Campus',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: Colors.white,
          surface: Colors.white,
          onPrimary: AppColors.textDark,
          onSecondary: AppColors.textDark,
          onBackground: AppColors.textDark,
          onSurface: AppColors.textDark,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: TextStyle(color: AppColors.textDark),
          displayMedium: TextStyle(color: AppColors.textDark),
          displaySmall: TextStyle(color: AppColors.textDark),
          headlineLarge: TextStyle(color: AppColors.textDark),
          headlineMedium: TextStyle(color: AppColors.textDark),
          headlineSmall: TextStyle(color: AppColors.textDark),
          titleLarge: TextStyle(color: AppColors.textDark),
          titleMedium: TextStyle(color: AppColors.textDark),
          titleSmall: TextStyle(color: AppColors.textDark),
          bodyLarge: TextStyle(color: AppColors.textDark),
          bodyMedium: TextStyle(color: AppColors.textDark),
          bodySmall: TextStyle(color: AppColors.textDark),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textDark,
          ),
        ),
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/webview': (context) => const WebViewPage(),
      },
    );
  }
}
