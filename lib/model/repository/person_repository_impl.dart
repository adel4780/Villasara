import '../entity/person.dart';
import '../util/constants.dart';
import 'person_repository.dart';

class PersonRepositoryImpl extends PersonRepository {

  @override
  Future<List<Person>> getPersons() async {
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Person> persons = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var person = Person.fromJson(data);
          persons.add(person);
        }
      }
      return persons;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  @override
  Future<List<Person>> searchPersons(int id) async{
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Person> persons = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var person = Person.fromJson(data);
          if(id == person.id)
          persons.add(person);
        }
      }
      return persons;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Person>> searchGuestPhone(String Phone, String role) async{
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Person> persons = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var person = Person.fromJson(data);
          if(person.phone_number == Phone && person.role == "guest") {
            persons.add(person);
          }
        }
      }
      return persons;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Person>> searchHostPhone(String Phone, String role) async{
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Person> persons = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var person = Person.fromJson(data);
          if(person.phone_number == Phone && person.role == "host") {
            persons.add(person);
          }
        }
      }
      return persons;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<Person> addPerson(Person person) async {
    var response = await dio.post(
      'Tenant/',
      data: person,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newPerson = Person.fromJson(response.data);
    return newPerson;
  }
  @override
  Future<void> editPerson(Person person) async {
    var response = await dio.patch(
      'Tenant/${person.id}/',
      data: person,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deletePerson(Person person) async {
    var response = await dio.delete(
      'Tenant/${person.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}