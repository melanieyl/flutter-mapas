class SearchResult {
  final bool cancel;
  final bool manual; // si se quiere intrducir el dato manualmente me avisara

  SearchResult({
    required this.cancel,
    this.manual = false, // si no me pone algo, por defecto sera fals
  });
  // Todo:
  // name, descripcion, latlon

  @override
  String toString() {
    return '{ cancel : $cancel , manual : $manual}';
  }
}
