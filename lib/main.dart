import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/di/injection.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/constant/app_sizes.dart';
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
          supportedLocales: const [
            Locale('en'),
          ],
          routerConfig: getIt<AppRouter>().config(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
