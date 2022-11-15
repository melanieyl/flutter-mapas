import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineas_sig/blocs/blocs.dart';
import 'package:lineas_sig/screens/screens.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocationBloc()),
      BlocProvider(create: (context) => MapBloc()),
    ],
    child: const MainClass(),
  ));
}

class MainClass extends StatelessWidget {
  const MainClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Planner Project',
      debugShowCheckedModeBanner: false,
      initialRoute: 'loading_screen',
      routes: {
        'home': (_) => HomePage(),
        'recorrido_lineas': (_) => RecorridoLineas(),
        'loading_screen': (_) => LoadingScreen(),
      },
    );
  }
}
