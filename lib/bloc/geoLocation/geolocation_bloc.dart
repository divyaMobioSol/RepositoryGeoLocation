import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:repository_app/bloc/geoLocation/geolocation_event.dart';
import 'package:repository_app/bloc/geoLocation/geolocation_state.dart';
import 'package:repository_app/repositories/geolocation/geo_Repository.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, geolocationState> {
  final GeoLocationRepository _geoLocationRepository;
  StreamSubscription? streamSubscription;

  GeolocationBloc({required GeoLocationRepository geoLocationRepository})
      : _geoLocationRepository = geoLocationRepository,
        super(GeolocationLoading()) {
    on<LoadGeolocation>((event, emit) async {
      if (state is GeolocationLoaded) {
        final Position? position =
            await _geoLocationRepository.getCurrentLocation();
        emit(GeolocationLoaded(position: position!));
        // emit(GeolocationLoaded(position: position));
      }
    });

    on<UpdateGeoLocation>((event, emit) async {
      if (state is GeolocationLoaded) {
        emit(GeolocationLoaded(position: event.position));
        // emit(GeolocationLoaded(position: position));
      }
    });

    // @override
    // Stream<geolocationState> mapEventState(
    //   GeolocationEvent event,
    // ) async* {
    //   if (event is LoadGeolocation) {
    //     yield* _mapLoadGeoLocationtoState();
    //   } else if (event is UpdateGeoLocation) {
    //     yield* _mapUpdateGeolocationState(event);
    //   }
    // }

    // Stream<geolocationState> _mapLoadGeoLocationtoState() async* {
    //   streamSubscription?.cancel();
    //   final Position? position =
    //       await _geoLocationRepository.getCurrentLocation();

    //   add(UpdateGeoLocation(position: position));
    // }

    // Stream<geolocationState> _mapUpdateGeolocationState(
    //     UpdateGeoLocation event) async* {
    //   yield GeolocationLoaded(position: event.position);

    //   @override
    //   Future<void> close() async {
    //     streamSubscription?.cancel();
    //     return super.close();
    //   }
  }
}
