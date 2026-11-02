import 'package:injectable/injectable.dart';

@lazySingleton
class PermissionService {
  Future<bool> requestCameraPermission() async => true;
  Future<bool> requestStoragePermission() async => true;
  Future<bool> requestLocationPermission() async => true;
}
