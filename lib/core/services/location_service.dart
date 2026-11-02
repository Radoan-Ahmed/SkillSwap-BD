import 'package:injectable/injectable.dart';

@lazySingleton
class LocationService {
  Future<Map<String, double>?> getCurrentCoordinates() async => null;
}
