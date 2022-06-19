import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadGeolocation extends GeolocationEvent {}

class UpdateGeoLocation extends GeolocationEvent {
  final Position position;

  UpdateGeoLocation({required this.position});
  @override
  // TODO: implement props
  List<Object> get props => [position];
}
