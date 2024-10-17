// ignore: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/core/constant/movies_sort_enum.dart';
import 'package:movies/presentation/router/app_router.dart';
import 'package:movies/presentation/theme/theme_store.dart';
import '../../../core/constant/api_endpoints.dart';
import '../../../core/i10n/l10n.dart';
import '../../../main.dart';
import '../../movie_image_network.dart';
import '../store/home_store.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = GetIt.I<HomeStore>();
  final themeStore = GetIt.I<ThemeStore>();

  @override
  void initState() {
    super.initState();

    if (homeStore.genresFuture == null ||
        (homeStore.genresFuture!.status == FutureStatus.pending &&
            homeStore.genres.isEmpty)) {
      homeStore.fetchGenres();
    }
  }

  @override
  Widget build(BuildContext context) {
    final myAppState = context.findAncestorStateOfType<MyAppState>();

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
          actions: [
            IconButton(
              icon: Icon(
                themeStore.themeMode == ThemeMode.dark
                    ? Icons.wb_sunny
                    : Icons.nights_stay,
                color: themeStore.themeMode == ThemeMode.dark
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () {
                final isDarkMode = themeStore.themeMode == ThemeMode.dark;
                themeStore.toggleTheme(!isDarkMode);
                myAppState?.rebuildApp();
              },
            )
          ],
        ),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (controller.isSearchMode.value) {
            //   controller.isSearchMode.value = false;
            //   return;
            // }
            // _showSearchDialog(context);
          },
          tooltip: 'Search',
          child: const Visibility(
            // visible: controller.isSearchMode.value,
            visible: false,
            replacement: Icon(Icons.search),
            child: Icon(Icons.close),
          ),
        ),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Observer(
          builder: (_) {
            final selectedGenre = homeStore.selectedGenre;

            return SizedBox(
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 2),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: PopupMenuButton<MoviesSortBy>(
                          icon: const Icon(Icons.filter_list),
                          onSelected: (MoviesSortBy? value) {
                            if (value != null) {
                              homeStore.setSortBy(value);
                            } else {
                              homeStore.setSortBy(null);
                            }
                          },
                          itemBuilder: (context) => [
                            _buildPopupMenuItem(
                              MoviesSortBy.popularityDesc,
                              homeStore.sortBy,
                              I10n.current.popularity_desc,
                            ),
                            _buildPopupMenuItem(
                              MoviesSortBy.popularityAsc,
                              homeStore.sortBy,
                              I10n.current.popularity_asc,
                            ),
                            _buildPopupMenuItem(
                              MoviesSortBy.releaseDateAsc,
                              homeStore.sortBy,
                              I10n.current.release_date_asc,
                            ),
                            _buildPopupMenuItem(
                              MoviesSortBy.releaseDateDesc,
                              homeStore.sortBy,
                              I10n.current.release_date_desc,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeStore.genres.length,
                      itemBuilder: (context, index) {
                        final genre = homeStore.genres[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            showCheckmark: false,
                            shape: const StadiumBorder(
                                side: BorderSide(color: Colors.black)),
                            label: Text(
                              genre.name,
                              style: TextStyle(
                                color: selectedGenre == genre
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            selected: selectedGenre == genre,
                            onSelected: (isSelected) {
                              homeStore
                                  .setSelectedGenre(isSelected ? genre : null);
                            },
                            selectedColor: Colors.green,
                            backgroundColor: Colors.grey[300],
                            checkmarkColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Observer(
            builder: (_) {
              final upComing = homeStore.discoverMovies;
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    homeStore.fetchDiscoveryMovies();
                  }
                  return false;
                },
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: upComing.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        final movieId = upComing[index];

                        AutoRouter.of(context)
                            .push(MovieDetailRoute(detailMovie: movieId));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: MovieImageNetwork(
                            imageUrl:
                                '${ApiEndpoints.baseImageUrl}${upComing[index].posterPath ?? ''}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  PopupMenuItem<MoviesSortBy> _buildPopupMenuItem(
      MoviesSortBy value, MoviesSortBy? currentSortBy, String title) {
    return PopupMenuItem<MoviesSortBy>(
      value: value,
      child: Text(
        title,
        style: TextStyle(
          color: currentSortBy == value ? Colors.green : null,
        ),
      ),
    );
  }
}
