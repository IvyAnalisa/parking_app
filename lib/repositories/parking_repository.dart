import '../models/parking.dart';

class ParkingRepository {
  List<Parking> parkings = [];

  void add(Parking parking) {
    parkings.add(parking);
  }

  List<Parking> getAll() {
    return parkings;
  }

  Parking? getById(String registrationNumber) {
    return parkings.firstWhere((parking) => parking.vehicle.regNumber == registrationNumber, );
  }

  void update(Parking updatedParking) {
    var index = parkings.indexWhere((parking) => parking.vehicle.regNumber == updatedParking.vehicle.regNumber);
    if (index != -1) {
      parkings[index] = updatedParking;
    }
  }

  void delete(String registrationNumber) {
    parkings.removeWhere((parking) => parking.vehicle.regNumber == registrationNumber);
  }
}
