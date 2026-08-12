import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/category.dart';

import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/screens/new_item_screen.dart';
import 'package:shopping_list/widgets/groceries/groceries_list.dart';

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  List<Grocery> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-prep-ff0a8-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );

    try {
      final response = await http.get(url);
      
      if (response.statusCode >= 400) {
        throw Exception('Failed to fetch data. Please try again later');
      }

      if (response.body == 'null') {
        if (!mounted) {
          return;
        }

        setState(() {
          _isLoading = false;
        });

        return;
      }

      final Map<String, dynamic> listData = json.decode(
        response.body,
      );
      final List<Grocery> loadedItems = [];

      for (final item in listData.entries) {
        final category = Category.values.firstWhere(
          (cat) => cat.name == item.value['category'],
        );
        loadedItems.add(
          Grocery(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
            isChecked: item.value['isChecked'],
          ),
        );
      }

      if (!mounted) {
        return;
      }

      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = 'Something went wrong! Please try again later.';
        _isLoading = false;
      });
    }
  }

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

  void _removeItem(Grocery grocery) async {
    final index = _groceryItems.indexOf(grocery);

    setState(() {
      _groceryItems.remove(grocery);
    });

    final url = Uri.https(
      'flutter-prep-ff0a8-default-rtdb.firebaseio.com',
      'shopping-list/${grocery.id}.json',
    );

    try {
      final response = await http.delete(url);

      if (response.statusCode >= 400) {
        throw Exception();
      }
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _groceryItems.insert(index, grocery);
      });
    }
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
        isLoading: _isLoading,
        error: _error,
      ),
    );
  }
}
