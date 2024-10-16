enum MoviesSortBy {
  releaseDateDesc('primary_release_date.desc'),
  releaseDateAsc('primary_release_date.asc'),
  popularityAsc('popularity.asc'),
  popularityDesc('popularity.desc');

  const MoviesSortBy(this.value);
  final String value;
}
