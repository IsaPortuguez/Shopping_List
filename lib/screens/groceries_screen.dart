import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/screens/new_item_screen.dart';
import 'package:shopping_list/widgets/groceries/groceries_list.dart';

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  final List<Grocery> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<Grocery>(
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(Grocery grocery) {
    setState(() {
      _groceryItems.remove(grocery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GroceriesList(
        groceries: _groceryItems,
        onRemoveItem: _removeItem,
      ),
    );
  }
}
