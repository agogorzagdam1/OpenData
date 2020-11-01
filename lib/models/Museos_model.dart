import 'museosnavarra_model.dart';

class Museos{
  List<ListaMuseos> lista= new List();
  Museos.fromJsonList(List<dynamic> jsonList) {
    if(jsonList == null) return;
    jsonList.forEach((json) {
      final m = ListaMuseos.fromJson(json);
     });
  }
}