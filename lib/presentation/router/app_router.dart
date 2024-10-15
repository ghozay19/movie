import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../home/page/home_page.dart';
import 'app_pages.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppPages.homeRoute,
          page: HomeRoute.page,
          initial: true,
        ),
      ];
}
