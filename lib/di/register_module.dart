import 'package:injectable/injectable.dart';
import 'package:movies/data/datasources/local/database.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppDatabase get db => AppDatabase();
}
