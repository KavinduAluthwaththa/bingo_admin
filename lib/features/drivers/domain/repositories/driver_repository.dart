import '../entities/driver_entity.dart';

abstract class DriverRepository {
  Stream<List<DriverEntity>> watchAll();
  Future<void> addDriver(DriverEntity driver);
}
