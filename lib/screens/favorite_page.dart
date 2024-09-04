import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Screen'),
          centerTitle: true,
        ),
        body: Consumer<FavoriteItemProvider>(builder: (key,value,child) => ListView.builder(
            itemCount: value.selectedItem.length,
            itemBuilder: (context, index) {
              final item = value.selectedItem[index];
              return ListTile(
                onTap: () {
                  if (value.selectedItem.contains(item)) {
                    value.removeFavorite(item);
                  } else {
                    value.addFovorite(item);
                  }
                },
                title: Text('Item ${item+1}'),
                trailing: const Icon(
                  Icons.favorite,
                ),
              );
            },
          ),
        ),
      );
  }
}
