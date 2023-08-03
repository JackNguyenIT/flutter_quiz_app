import 'dart:async';

import 'package:floor/floor.dart';
import 'package:quiz_app/data/local/database/user/user_dao.dart';
import 'package:quiz_app/data/user/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'user_database.g.dart';

@Database(version: 1, entities: [User])
abstract class UserDatabase extends FloorDatabase {
  UserDao get userDao;
}
