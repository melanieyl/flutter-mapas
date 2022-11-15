import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineas_sig/blocs/blocs.dart';
import 'package:lineas_sig/delegate/delegate.dart';
import 'package:lineas_sig/models/models.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
            ? const SizedBox()
            : const _SearchBarBody();
      },
    );
  }
}

class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({super.key});

  //cuando recibo el resultado
  void onSearchResults(BuildContext context, SearchResult result) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if (result.manual) {
      //cambio el estado
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 50,
      child: GestureDetector(
        onTap: () async {
          // uso una herramienta de flutter que me ayuda a realizar un buscador
          // lo que le mande siempre va ser opcional
          final result = await showSearch(
              context: context, delegate: SearchDestinationDelegate());
          if (result == null) return;
          onSearchResults(context, result);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Text(
            '¿donde quieres ir?',
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    ));
  }
}
