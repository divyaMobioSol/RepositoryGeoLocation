import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_bloc.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_event.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_state.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
      builder: (context, state) {
        if (state is AutoCompleteLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AutoCompleteLoaded) {
          return TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search Location',
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.only(left: 20, bottom: 5, right: 5),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.zoom_out_map_outlined,
              ),
            ),
            onChanged: (val) {
              context
                  .read<AutoCompleteBloc>()
                  .add(LoadAutoComplete(searchInput: val));
            },
          );
        } else
          return Text('error');
      },
    );
  }
}
