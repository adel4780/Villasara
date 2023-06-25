import '../entity/person.dart';

abstract class PersonRepository{
  Future<List<Person>> getPersons();

  Future<List<Person>> searchPersons(int id);

  Future<List<Person>> searchGuestPhone(String Phone, String role);

  Future<List<Person>> searchHostPhone(String Phone, String role);

  Future<Person> addPerson(Person person);

  Future<void> editPerson(Person person);

  Future<void> deletePerson(Person person);
}