import 'person.dart';

class Vehicle {
  String regNumber;
  String type; // (Car, Motorcycle, etc.)
  Person owner;

  Vehicle(this.regNumber, this.type, this.owner);
}
