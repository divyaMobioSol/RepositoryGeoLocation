// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_bloc.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_state.dart';
import 'package:repository_app/bloc/geoLocation/geolocation_bloc.dart';
import 'package:repository_app/bloc/geoLocation/geolocation_state.dart';
import 'package:repository_app/widgets/gmap.dart';
import 'package:repository_app/widgets/searchbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: BlocBuilder<GeolocationBloc, geolocationState>(
                builder: (context, state) {
                  if (state is GeolocationLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeolocationLoaded) {
                    return Gmap(
                      lat: 10,
                      long: 10,
                    );
                  } else {
                    return Text('error');
                  }
                },
              ),
            ),
            // Positioned(
            //     top: 40,
            //     left: 30,
            //     right: 30,
            //     child: Column(
            //       children: [
            //         SearchBox(),
            //         BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
            //             builder: ((context, state) {
            //           if (state is AutoCompleteLoading) {
            //             return CircularProgressIndicator();
            //           } else if (state is AutoCompleteLoaded) {
            //             return Container(
            //                 height: 300,
            //                 margin: EdgeInsets.all(8),
            //                 color: state.autoComplete.length > 0
            //                     ? Colors.transparent
            //                     : Colors.black.withOpacity(0.6),
            //                 child: ListView.builder(
            //                     itemCount: state.autoComplete.length,
            //                     itemBuilder: (context, index) {
            //                       return ListTile(
            //                         title: Text(
            //                           state.autoComplete[index].description,
            //                           style: TextStyle(color: Colors.white),
            //                         ),
            //                       );
            //                     }));
            //           } else
            //             return Text('error');
            //         }))
            //       ],
            //     )),
            // Positioned(
            //     bottom: 50,
            //     left: 20,
            //     right: 20,
            //     child: ElevatedButton(
            //       child: Text('Save'),
            //       onPressed: () {},
            //     ))
          ],
        ));
  }
}
