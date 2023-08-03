import 'package:floor/floor.dart';
import 'package:quiz_app/data/user/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User LIMIT 1')
  Future<User?> getUser();

  @Query('SELECT * FROM User WHERE user_id = :id')
  Stream<User?> findUserById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User user);
}
