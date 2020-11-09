import 'museosnavarra_model.dart';

class Museos {
  List<Museo> lista = new List();
  Museos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final m = Museo.fromJson(json);
      lista.add(m);
    });
  }
}