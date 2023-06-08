import '../../model/entity/user.dart';

abstract class UserRepository{
  Future<List<User>> getUsers();

  Future<List<User>> searchUsers(int id);

  Future<List<User>> searchPhone(String Phone);

  Future<User> addUser(User user);

  Future<void> editUser(User user);

  Future<void> deleteUser(User user);
}