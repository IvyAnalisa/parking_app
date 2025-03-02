import '../models/parking_slot.dart';

class ParkingSlotRepository {
  // Correct the list name to hold ParkingSlot objects.
  List<ParkingSlot> parkingSlots = [];

  // Add method should accept a ParkingSlot object and add it to the list.
  void add(ParkingSlot parkingSlot) {
    parkingSlots.add(parkingSlot);
  }

  // Get all parking slots.
  List<ParkingSlot> getAll() {
    return parkingSlots;
  }

  // Get a parking slot by its ID.
  ParkingSlot? getById(String id) {
    return parkingSlots.firstWhere((slot) => slot.id == id, );
  }

  // Update a parking slot.
  void update(ParkingSlot updatedSlot) {
    var index = parkingSlots.indexWhere((slot) => slot.id == updatedSlot.id);
    if (index != -1) {
      parkingSlots[index] = updatedSlot;
    }
  }

  // Delete a parking slot by its ID.
  void delete(String id) {
    parkingSlots.removeWhere((slot) => slot.id == id);
  }
}
