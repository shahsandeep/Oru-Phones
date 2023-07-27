import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oru_phones/services/firebase_services.dart';
import 'package:oru_phones/view_models/search_view_models.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'view_models/product_view_models.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.route: (context) => const HomeScreen(),
          NotificationScreen.route: (context) => const NotificationScreen(),
          SearchScreen.route: (context) => const SearchScreen(),
        },
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'ORU Phones',
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Robboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.route,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
