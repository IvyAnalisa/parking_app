import 'vehicle.dart';
import 'parking_slot.dart';

class Parking {
  Vehicle vehicle;
  ParkingSlot parkingSlot;
  DateTime? startTime; // Can be null if still parked
  DateTime? endTime; // Can be null if still parked

  Parking(this.vehicle, this.parkingSlot, this.startTime, this.endTime);

  
}
