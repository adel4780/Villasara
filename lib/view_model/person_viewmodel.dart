import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/entity/person.dart';
import '../model/repository/person_repository_impl.dart';

class PersonViewModel extends ChangeNotifier {
  var repository = PersonRepositoryImpl();

  StreamController<List<Person>> persons =
  StreamController<List<Person>>();

  void getPersons() async {
    persons.add(await repository.getPersons());
    notifyListeners();
  }
  void searchPersons(int id) async {
    persons.add(await repository.searchPersons(id));
    notifyListeners();
  }
  void searchGuestPhone(String Phone, String role) async {
    persons.add(await repository.searchGuestPhone(Phone, role));
    notifyListeners();
  }
  void searchHostPhone(String Phone, String role) async {
    persons.add(await repository.searchHostPhone(Phone, role));
    notifyListeners();
  }
  Future<Person> addPerson(Person person) async {
    var newPerson = await repository.addPerson(person);
    notifyListeners();
    return newPerson;
  }
  Future<void> editPerson(Person person) async {
    repository.editPerson(person);
    notifyListeners();
  }
  void deletePerson(Person person) async {
    repository.deletePerson(person);
    notifyListeners();
  }
}