part of 'search_bloc.dart';

class SearchState extends Equatable {
  // si quiero o no que despliegeue el marcador manual (widget)
  final bool displayManualMarker;

  const SearchState({this.displayManualMarker = false});

  //para copiar mi estado
  SearchState copoyWith({bool? displayManualMarker}) => SearchState(
      displayManualMarker: displayManualMarker ?? this.displayManualMarker);

// para que sepa cuando cambie de estado
  @override
  List<Object> get props => [displayManualMarker];
}
