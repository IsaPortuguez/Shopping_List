import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/widgets/groceries/grocery_item.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({
    super.key,
    required this.groceries,
  });

  final List<Grocery> groceries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(groceries[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(
            alpha: 0.75,
          ),
          margin: Theme.of(context).cardTheme.margin,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        secondaryBackground: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
          margin: Theme.of(context).cardTheme.margin,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) {},
        child: GroceryItem(groceries[index]),
      ),
    );
  }
}
