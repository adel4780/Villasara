import '../../model/entity/user.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';
import 'user_repository.dart';


class UserRepositoryImpl extends UserRepository {
  var dio = Dio(options);

  @override
  Future<List<User>> getUsers() async {
    var response = await dio.get('users/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<User> users = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var user = User.fromJson(data);
          users.add(user);
        }
      }
      return users;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<User>> searchUsers(int id)  async {
    var response = await dio.get('users/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<User> users = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var user = User.fromJson(data);
          if(user.id == id) {
            users.add(user);
          }
        }
      }
      return users;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<User>> searchPhone(String Phone) async{
    var response = await dio.get('users/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<User> users = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var user = User.fromJson(data);
          if(user.phone_number == Phone) {
            users.add(user);
          }
        }
      }
      return users;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<User> addUser(User user) async {
    var response = await dio.post(
      'users/',
      data: user,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newUser = User.fromJson(response.data);
    return newUser;
  }
  @override
  Future<void> editUser(User user) async {
    var response = await dio.patch(
      'users/${user.id}/',
      data: user,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteUser(User user) async {
    var response = await dio.delete(
      'users/${user.id}/',
    );
    print('response: ${response.statusMessage}');
  }




}