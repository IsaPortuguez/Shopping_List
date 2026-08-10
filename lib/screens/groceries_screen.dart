import 'package:flutter/material.dart';
import 'package:shopping_list/data/groceries.dart';
import 'package:shopping_list/widgets/groceries/groceries_list.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
      ),
      body: GroceriesList(groceries: groceries),
    );
  }
}
