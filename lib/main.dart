import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/di/injection.dart';

import 'core/constant/app_sizes.dart';
import 'core/i10n/l10n.dart';
import 'presentation/router/app_router.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(AppSizes.appScreenWidth, AppSizes.appScreenHeight),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
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
        ),
      ),
    );
  }
}
