import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    //cambio el estado del manual
    on<OnActivateManualMarkerEvent>(
        (event, emit) => emit(state.copoyWith(displayManualMarker: true)));
  }
}
