import 'package:flutter/material.dart';
import 'package:lineas_sig/delegate/delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

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
          print(result);
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
