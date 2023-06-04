import 'dart:async';
import '../model/entity/user.dart';
import '../model/repository/user_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  var repository = UserRepositoryImpl();

  StreamController<List<User>> users =
  StreamController<List<User>>();

  void getUsers() async {
    users.add(await repository.getUsers());
    notifyListeners();
  }
  void searchUsers(int id) async {
    users.add(await repository.searchUsers(id));
    notifyListeners();
  }
  void searchPhone(String Phone) async {
    users.add(await repository.searchPhone(Phone));
    notifyListeners();
  }
  Future<User> addUser(User user) async {
    var newUser = await repository.addUser(user);
    notifyListeners();
    return newUser;
  }
  void editUser(User user) async {
    repository.editUser(user);
    notifyListeners();
  }
  void deleteUser(User user) async {
    repository.deleteUser(user);
    notifyListeners();
  }
}