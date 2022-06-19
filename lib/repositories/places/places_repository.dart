import 'package:repository_app/repositories/places/base_place_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/place_autocomplete_model.dart';

class PlaceRepository extends BasePlaceRepository {
  final String key = 'AIzaSyCXJ01QcTPFILHwH5oHC7cCjXOiKGpRWL4';
  final String types = 'geocode';

  Future<List<AutoPlaceComplete>> getAutoComplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => AutoPlaceComplete.fromJson(place)).toList();
  }
}
