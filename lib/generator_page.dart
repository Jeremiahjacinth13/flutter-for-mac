import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'package:english_words/english_words.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch<MyAppState>();
    WordPair pair = appState.current;
    List<WordPair> favorites = appState.favorites;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BigCard(pair: pair),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => appState.toggleFavorite(pair),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(favorites.contains(pair)
                            ? Icons.favorite
                            : Icons.favorite_border),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Like")
                      ],
                    ),
                  )),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: appState.getNext,
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text('Next'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          '${pair.first} ${pair.second}',
          style: style,
        ),
      ),
    );
  }
}
