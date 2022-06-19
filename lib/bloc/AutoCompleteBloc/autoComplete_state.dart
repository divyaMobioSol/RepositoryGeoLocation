import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:repository_app/models/place_autocomplete_model.dart';

abstract class AutoCompleteState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AutoCompleteLoading extends AutoCompleteState {}

class AutoCompleteLoaded extends AutoCompleteState {
  final List<AutoPlaceComplete> autoComplete;

  AutoCompleteLoaded({required this.autoComplete});
  @override
  List<Object?> get props => [autoComplete];
}

class AutoCompleteError extends AutoCompleteState {}
