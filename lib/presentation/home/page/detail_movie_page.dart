import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movies/core/constant/api_endpoints.dart';
import 'package:movies/domain/entities/movie.dart';
import '../../movie_image_network.dart';
import '../store/detail_movie_store.dart';

@RoutePage()
class MovieDetailPage extends StatefulWidget {
  final Movie detailMovie;

  const MovieDetailPage({Key? key, required this.detailMovie})
      : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late DetailMovieStore detailStore;

  @override
  void initState() {
    super.initState();
    detailStore = GetIt.I<DetailMovieStore>();

    // Simpan movieId ke store di sini saat inisialisasi
    detailStore.setMovieId(widget.detailMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Details")),
      body: Observer(
        builder: (_) {
          return Column(children: [
            MovieImageNetwork(
              imageUrl:
                  '${ApiEndpoints.baseImageUrl}${detailStore.detailMovie?.backdropPath}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
              borderRadius: const BorderRadius.all(const Radius.circular(0)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(detailStore.detailMovie?.title ?? ''),
                  Text(detailStore.detailMovie?.overview ?? ''),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}
