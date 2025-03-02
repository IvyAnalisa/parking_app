//uppgift 1
// Student name:Ivy Analisa La
// to run app: dart bin/main.dart5

import 'dart:io';
import 'package:parking_app/models/parking.dart';
import 'package:parking_app/models/parking_slot.dart';
import 'package:parking_app/models/person.dart';
import 'package:parking_app/models/vehicle.dart';

import 'package:parking_app/repositories/person_repository.dart';
import 'package:parking_app/repositories/vehicle_repository.dart';
import 'package:parking_app/repositories/parking_slot_repository.dart';
import 'package:parking_app/repositories/parking_repository.dart';

void main() {
  var personRepo = PersonRepository();
  var vehicleRepo = VehicleRepository();
  var parkingSlotRepo = ParkingSlotRepository();
  var parkingRepo = ParkingRepository();

  // Create main menu
  while (true) {
    print('Välkommen till Parkeringsappen!');
    print('Vad vill du hantera?');
    print('1. Personer');
    print('2. Fordon');
    print('3. Parkeringsplatser');
    print('4. Parkeringar');
    print('5. Avsluta');
    stdout.write('Välj ett alternativ (1-5): ');
    var choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':// for  new people information registration
        handlePersonOperations(personRepo);
        break;
      case '2':// for verhicle information registration
        handleVehicleOperations(vehicleRepo, personRepo);
        break;
      case '3'://for parking slot registeration
        handleParkingSlotOperations(parkingSlotRepo);
        break;
      case '4'://for parking infomation
        handleParkingOperations(parkingRepo, vehicleRepo, parkingSlotRepo);
        break;
      case '5':
        print('Avslutar...');
        return;
      default:
        print('Ogiltigt val, försök igen.');
    }
  }
}

void handlePersonOperations(PersonRepository personRepo) {
  // create person menu
  while (true) {
    print("What do you want to do with Persons?");
    print("1. Create new person");
    print("2. View all persons");
    print("3. Update person");
    print("4. Delete person");
    print("5. Go back main menu");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Create new person
      print("Enter name: ");
      String? name = stdin.readLineSync();
      print("Enter personnummer: ");
      String? personNummer = stdin.readLineSync();

      Person person = Person(name!, personNummer!);
      personRepo.add(person);
      print("Person added!");
    } else if (choice == '2') {
      // View all persons
      var persons = personRepo.getAll();
      for (var person in persons) {
        print("Name: ${person.name}, Personnummer: ${person.personNumber}");
      }
    } else if (choice == '3') {
      // Update person
      print("Enter personnummer of person to update: ");
      String? personnummer = stdin.readLineSync();
      var person = personRepo.getById(personnummer!);
      if (person != null) {
        print("Enter new name: ");
        String? newName = stdin.readLineSync();
        person.name = newName!;
        personRepo.update(person);
        print("Person updated!");
      } else {
        print("Person not found.");
      }
    } else if (choice == '4') {
      // Delete person
      print("Enter personnummer of person to delete: ");
      String? personnummer = stdin.readLineSync();
      personRepo.delete(personnummer!);
      print("Person deleted!");
    } else if (choice == '5') {
      break; // Go back to the main menu
    } else {
      print("Invalid option. Please try again.");
    }
  }
}



void handleVehicleOperations(VehicleRepository vehicleRepo, PersonRepository personRepo) {
 // create vehicle menu
  while (true) {
    print("What do you want to do with Vehicles?");
    print("1. Create new vehicle");
    print("2. View all vehicles");
    print("3. Update vehicle");
    print("4. Delete vehicle");
    print("5. Go back");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Create new vehicle
      print("Enter vehicle registration number: ");
      String? regNumber = stdin.readLineSync();
      print("Enter vehicle type (e.g. car, motorcycle): ");
      String? type = stdin.readLineSync();
      print("Enter owner personnummer: ");
      String? ownerPersonnummer = stdin.readLineSync();

      Person? owner = personRepo.getById(ownerPersonnummer!);
      if (owner != null) {
        Vehicle vehicle = Vehicle(regNumber!, type!, owner);
        vehicleRepo.add(vehicle);
        print("Vehicle added!");
      } else {
        print("Owner not found.");
      }
    } else if (choice == '2') {
      // View all vehicles
      var vehicles = vehicleRepo.getAll();
      for (var vehicle in vehicles) {
        print("Reg Number: ${vehicle.regNumber}, Type: ${vehicle.type}, Owner: ${vehicle.owner.name}");
      }
    } else if (choice == '3') {
      // Update vehicle
      print("Enter vehicle registration number to update: ");
      String? regNumber = stdin.readLineSync();
      var vehicle = vehicleRepo.getById(regNumber!);
      if (vehicle != null) {
        print("Enter new type: ");
        String? newType = stdin.readLineSync();
        vehicle.type = newType!;
        vehicleRepo.update(vehicle);
        print("Vehicle updated!");
      } else {
        print("Vehicle not found.");
      }
    } else if (choice == '4') {
      // Delete vehicle
      print("Enter vehicle registration number to delete: ");
      String? regNumber = stdin.readLineSync();
      vehicleRepo.delete(regNumber!);
      print("Vehicle deleted!");
    } else if (choice == '5') {
      break; // Go back to the main menu
    } else {
      print("Invalid option. Please try again.");
    }
  }
}

void handleParkingOperations(ParkingRepository parkingRepo, VehicleRepository vehicleRepo, ParkingSlotRepository parkingSlotRepo) {
  // create parking menu
  while (true) {
    print("What do you want to do with Parking?");
    print("1. Create new parking");
    print("2. View all parkings");
    print("3. Update parking");
    print("4. Delete parking");
    print("5. Go back");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Create new parking
      print("Enter vehicle registration number: ");
      String? regNumber = stdin.readLineSync();
      print("Enter parking slot ID: ");
      String? slotId = stdin.readLineSync();

      Vehicle? vehicle = vehicleRepo.getById(regNumber!);
      ParkingSlot? slot = parkingSlotRepo.getById(slotId!);

      if (vehicle != null && slot != null) {
        Parking parking = Parking(vehicle, slot, DateTime.now(), null);
        parkingRepo.add(parking);
        print("Parking created!");
      } else {
        print("Vehicle or Parking Slot not found.");
      }
    } else if (choice == '2') {
      // View all parkings
      var parkings = parkingRepo.getAll();
      for (var parking in parkings) {
        print("Vehicle: ${parking.vehicle.regNumber}, Slot: ${parking.parkingSlot.id}, Start time: ${parking.startTime}");
      }
    } else if (choice == '3') {
      // Update parking
      print("Enter vehicle registration number to update parking: ");
      String? regNumber = stdin.readLineSync();
      var parking = parkingRepo.getById(regNumber!);
      if (parking != null) {
        print("Enter new parking slot ID: ");
        String? newSlotId = stdin.readLineSync();
        ParkingSlot? newSlot = parkingSlotRepo.getById(newSlotId!);
        if (newSlot != null) {
          parking.parkingSlot = newSlot;
          parkingRepo.update(parking);
          print("Parking updated!");
        } else {
          print("Parking slot not found.");
        }
      } else {
        print("Parking not found.");
      }
    } else if (choice == '4') {
      // Delete parking
      print("Enter vehicle registration number to delete parking: ");
      String? regNumber = stdin.readLineSync();
      parkingRepo.delete(regNumber!);
      print("Parking deleted!");
    } else if (choice == '5') {
      break; // Go back to the main menu
    } else {
      print("Invalid option. Please try again.");
    }
  }
}



void handleParkingSlotOperations(ParkingSlotRepository parkingSlotRepo) {
  while (true) {
    print("What do you want to do with Parking Slots?");
    print("1. Create new parking slot");
    print("2. View all parking slots");
    print("3. Update parking slot");
    print("4. Delete parking slot");
    print("5. Go back");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Create new parking slot
      print("Enter parking slot ID: ");
      String? id = stdin.readLineSync();
      print("Enter address: ");
      String? address = stdin.readLineSync();
      print("Enter price per hour: ");
      double? pricePerHour = double.tryParse(stdin.readLineSync()!);

      if (pricePerHour != null) {
        ParkingSlot slot = ParkingSlot(id!, address!, pricePerHour);
        parkingSlotRepo.add(slot);
        print("Parking slot added!");
      } else {
        print("Invalid price.");
      }
    } else if (choice == '2') {
      // View all parking slots
      var slots = parkingSlotRepo.getAll();
      for (var slot in slots) {
        print("Slot ID: ${slot.id}, Address: ${slot.address}, Price per hour: ${slot.pricePerHour}");
      }
    } else if (choice == '3') {
      // Update parking slot
      print("Enter parking slot ID to update: ");
      String? id = stdin.readLineSync();
      var slot = parkingSlotRepo.getById(id!);
      if (slot != null) {
        print("Enter new price per hour: ");
        double? newPrice = double.tryParse(stdin.readLineSync()!);
        if (newPrice != null) {
          slot.pricePerHour = newPrice;
          parkingSlotRepo.update(slot);
          print("Parking slot updated!");
        } else {
          print("Invalid price.");
        }
      } else {
        print("Parking slot not found.");
      }
    } else if (choice == '4') {
      // Delete parking slot
      print("Enter parking slot ID to delete: ");
      String? id = stdin.readLineSync();
      parkingSlotRepo.delete(id!);
      print("Parking slot deleted!");
    } else if (choice == '5') {
      break; // Go back to the main menu
    } else {
      print("Invalid option. Please try again.");
    }
  }
}



