import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch();

    if (appState.favorites.isEmpty) {
      return (Center(
        child: Text(
          "No Favorites",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ));
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Favorites",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () => appState.toggleFavorite(pair),
            ),
            title: Text(pair.asPascalCase),
          )
      ],
    );
  }
}
