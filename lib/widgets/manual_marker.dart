import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineas_sig/blocs/blocs.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        // si es true me rederige al manualmarker
        return state.displayManualMarker
            ? const _ManualMarkerBody()
            : const SizedBox();
      },
    );
  }
}

class _ManualMarkerBody extends StatelessWidget {
  const _ManualMarkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            //button para ir atras
            const Positioned(top: 70, left: 20, child: _BtnBack()),

            // el icono
            Center(
              child: Transform.translate(
                offset:
                    Offset(0, -22), // lo estoy moviendo un poco mas para arriba
                child: BounceInDown(
                    from: 100,
                    child: const Icon(Icons.location_on_rounded, size: 60)),
              ),
            ),
            //bottom de confirmar
            Positioned(
                bottom: 70,
                left: 40,
                child: MaterialButton(
                  minWidth: size.width - 120,
                  // ignore: sort_child_properties_last
                  child: const Text('Confirmar destino',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      )),
                  color: Colors.black,
                  elevation: 0,
                  height: 50,
                  shape: const StadiumBorder(),
                  onPressed: () {},
                ))
          ],
        ));
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(microseconds: 100),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            //cancelar el marcador manual
          },
        ),
      ),
    );
  }
}
