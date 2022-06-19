import 'package:equatable/equatable.dart';

abstract class AutoCompleteEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadAutoComplete extends AutoCompleteEvent {
  final String searchInput;

  LoadAutoComplete({this.searchInput = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [searchInput];
}
