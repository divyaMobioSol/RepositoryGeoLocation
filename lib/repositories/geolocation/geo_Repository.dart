import 'package:geolocator/geolocator.dart';
import 'package:repository_app/repositories/geolocation/base_geoRepository.dart';

class GeoLocationRepository extends BaseGeoLocationRepository {
  GeoLocationRepository();

  @override
  Future<Position?> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
