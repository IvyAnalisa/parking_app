import '../models/vehicle.dart';

class VehicleRepository {
  List<Vehicle> vehicles = [];

  void add(Vehicle vehicle) {
    vehicles.add(vehicle);
  }

  List<Vehicle> getAll() {
    return vehicles;
  }

  Vehicle? getById(String registrationNumber) {
    return vehicles.firstWhere((vehicle) => vehicle.regNumber == registrationNumber,);
  }

  void update(Vehicle updatedVehicle) {
    var index = vehicles.indexWhere((vehicle) => vehicle.regNumber == updatedVehicle.regNumber);
    if (index != -1) {
      vehicles[index] = updatedVehicle;
    }
  }

  void delete(String registrationNumber) {
    vehicles.removeWhere((vehicle) => vehicle.regNumber == registrationNumber);
  }
}
