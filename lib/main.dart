import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/brick/repository.dart';
import 'package:streakit/firebase_options.dart';
import 'package:streakit/services/analytics_service.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:sqflite/sqflite.dart' show databaseFactory;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Repository.configure(databaseFactory);
  await Repository().initialize();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final analyticsService = locator<AnalyticsService>();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
        analyticsService.getAnalyticsObserver(),
      ],
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.manrope().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          primary: AppColors.blackColor,
          seedColor: AppColors.iceBlue,
          secondary: AppColors.rawSienna,
        ),
        textTheme: AppTextStyles.textTheme,
      ),
    );
  }
}
