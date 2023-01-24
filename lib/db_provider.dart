import 'dart:io';
import 'package:movies/data/movie.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    _database ??= await initDB();

    return _database;
  }

  // Create the database and the Movie table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'movie_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Movie('
          'id INTEGER PRIMARY KEY,'
          'poster_path TEXT,'
          'title TEXT,'
          'overview TEXT,'
          'release_date TEXT,'
          'vote_average DOUBLE'
          ')');
    });
  }

  // Insert employee on database
  createMovie(Movie newmovie, {bool onRefresh = false}) async {
    final db = await database;

    final result = onRefresh
        ? await db?.insert(
            'Movie',
            newmovie.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          )
        : await db?.insert('Movie', newmovie.toJson());

    return result;
  }

  Future<List<Movie>> getAllMovies() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Movie");

    List<Movie> list = null == res || res.isEmpty
        ? []
        : res.map((c) => Movie.fromJson(c)).toList();

    return list;
  }
}
