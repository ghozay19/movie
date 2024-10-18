// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies/di/injection.dart';

import 'core/constant/app_sizes.dart';
import 'core/i10n/l10n.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/theme_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Key _appKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final themeStore = getIt<ThemeStore>();
    themeStore.loadThemePreference();
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(AppSizes.appScreenWidth, AppSizes.appScreenHeight),
        builder: (context, child) => Observer(builder: (_) {
          return MaterialApp.router(
            key: _appKey,
            debugShowCheckedModeBanner: false,
            theme: themeStore.themeMode == ThemeMode.dark
                ? ThemeData.dark().copyWith(
                    textTheme: const TextTheme(
                      bodyLarge: TextStyle(color: Colors.white),
                      bodyMedium: TextStyle(color: Colors.white),
                      headlineMedium: TextStyle(color: Colors.white),
                    ),
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: Colors.green,
                    ),
                  )
                : ThemeData.light().copyWith(
                    textTheme: const TextTheme(
                      bodyLarge: TextStyle(color: Colors.black),
                      bodyMedium: TextStyle(color: Colors.black),
                      headlineMedium: TextStyle(color: Colors.black),
                    ),
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: Colors.green,
                    ),
                  ),
            localizationsDelegates: const [
              I10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('id'),
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) return supportedLocales.first;
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            routerConfig: getIt<AppRouter>().config(),
          );
        }),
      ),
    );
  }

  void rebuildApp() {
    setState(() {
      _appKey = UniqueKey();
    });
  }
}
