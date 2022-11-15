import 'package:flutter/material.dart';
import 'package:lineas_sig/models/search_result.dart';

// le voy a mandar mi modelo search result
class SearchDestinationDelegate extends SearchDelegate<SearchResult> {
// constructor propio del search delegate
  SearchDestinationDelegate() : super(searchFieldLabel: 'Buscar...');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        //close(context, null);
        // debo devolver algo que sea de tipo searresult
        final result = SearchResult(cancel: true);
        close(context, result);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buidresults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //construir un list view ( leading para colocar icons)
    // vamos a colocar un marcador manual
    return ListView(
      children: [
        ListTile(
          leading: const Icon(
            Icons.location_on_outlined,
            color: Colors.black,
          ),
          title: const Text(
            'colocar la ubicacion manualmente ',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            //regresa algo de tipo searhresult
            // ya que la persona selecciono esto, siginfica que realizara
            //una busqueda manual, por eso lo ponemos en true

            final result = SearchResult(cancel: false, manual: true);
            close(context, result);
          },
        )
      ],
    );
  }
}
