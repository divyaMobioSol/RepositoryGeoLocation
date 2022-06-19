import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_bloc.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_event.dart';
import 'package:repository_app/bloc/geoLocation/geolocation_bloc.dart';
import 'package:repository_app/bloc/geoLocation/geolocation_event.dart';
import 'package:repository_app/homePage.dart';
import 'package:repository_app/repositories/geolocation/geo_Repository.dart';
import 'package:repository_app/repositories/places/places_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeoLocationRepository>(
            create: (context) => GeoLocationRepository()),
        RepositoryProvider<PlaceRepository>(
            create: (context) => PlaceRepository())
      ],
      //create: (context) => SubjectRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geoLocationRepository: context.read<GeoLocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutoCompleteBloc(
                  placeRepository: context.read<PlaceRepository>())
                ..add(LoadAutoComplete()))
        ],
        //create: (context) => SubjectBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
