import 'package:geolocator/geolocator.dart';
import 'package:repository_app/models/place_autocomplete_model.dart';

abstract class BasePlaceRepository {
  Future<List<AutoPlaceComplete>?> getAutoComplete(String searchInput) async {}
}
