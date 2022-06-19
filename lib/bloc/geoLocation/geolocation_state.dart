import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class geolocationState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GeolocationLoading extends geolocationState {}

class GeolocationLoaded extends geolocationState {
  final Position position;

  GeolocationLoaded({required this.position});
  @override
  List<Object> get props => [position];
}

class GeolocationError extends geolocationState {}
