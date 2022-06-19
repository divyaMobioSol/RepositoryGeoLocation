import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_event.dart';
import 'package:repository_app/bloc/AutoCompleteBloc/autoComplete_state.dart';
import 'package:repository_app/models/place_autocomplete_model.dart';
import 'package:repository_app/repositories/places/places_repository.dart';

import '../../repositories/places/base_place_repository.dart';

class AutoCompleteBloc extends Bloc<AutoCompleteEvent, AutoCompleteState> {
  final PlaceRepository _placeRepository;
  StreamSubscription? streamSubscription;

  AutoCompleteBloc({required PlaceRepository placeRepository})
      : _placeRepository = placeRepository,
        super((AutoCompleteLoading())) {
    on<LoadAutoComplete>((event, emit) async {
      final List<AutoPlaceComplete> autoComplete =
          await _placeRepository.getAutoComplete(event.searchInput);
      emit(AutoCompleteLoaded(autoComplete: autoComplete));
    });
  }
}











//   @override
//   Stream<AutoCompleteState> mapEventState(
//     AutoCompleteEvent event,
//   ) async* {
//     if (event is LoadAutoComplete) {
//       yield* _mapCompletetoState(event);
//     }
//   }

//   Stream<AutoCompleteState> _mapCompletetoState(LoadAutoComplete event) async* {
//     streamSubscription?.cancel();
//     final List<AutoPlaceComplete> autoComplete =
//         await _placeRepository.getAutoComplete(event.searchInput);

//     yield AutoCompleteLoaded(autoComplete: autoComplete);
//   }
// }
