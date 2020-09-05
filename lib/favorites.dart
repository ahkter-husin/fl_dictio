import 'package:fl_dictio/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:owlbot_dart/owlbot_dart.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(favoritesBox).listenable(),
        builder: (context, box, child) {
          final favs = box.values;
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              ...favs.map((fav) {
                final res = OwlBotResponse.fromJson(fav);
                return DictionaryListItem(
                  dictionaryItem: res,
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
