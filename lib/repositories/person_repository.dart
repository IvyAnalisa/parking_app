import '../models/person.dart';

class PersonRepository {
  List<Person> persons = [];

  void add(Person person) {
    persons.add(person);
  }

  List<Person> getAll() {
    return persons;
  }

  Person? getById(String personNumber) {
    return persons.firstWhere((person) => person.personNumber == personNumber, );
  }

  void update(Person updatedPerson) {
    var index = persons.indexWhere((person) => person.personNumber == updatedPerson.personNumber);
    if (index != -1) {
      persons[index] = updatedPerson;
    }
  }

  void delete(String personNumber) {
    persons.removeWhere((person) => person.personNumber == personNumber);
  }
}
