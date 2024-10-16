// ignore: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/movie.dart';
import '../bookmark/page/boomark_page.dart';
import '../dashboard/page/dashboard_page.dart';
import '../detail/page/detail_movie_page.dart';
import '../home/page/home_page.dart';
import 'app_pages.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppPages.dashboardRoute,
          page: DashboardRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: AppPages.homeRoute,
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: AppPages.bookmarkRoute,
          page: BookmarkRoute.page,
        ),
        AutoRoute(
          path: AppPages.detailMovieRoute,
          page: MovieDetailRoute.page,
        ),
      ];
}
