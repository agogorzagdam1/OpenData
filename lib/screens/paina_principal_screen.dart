import 'package:flutter/material.dart';

import 'package:museos/widget/menu_widget.dart';

class PaginaPrincipalScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu principal'),
      ),
      drawer: MenuPaginaPrincipal(),
    );
  }
}
