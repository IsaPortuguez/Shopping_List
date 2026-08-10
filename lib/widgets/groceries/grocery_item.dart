import 'package:flutter/material.dart';

import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery.dart';

class GroceryItem extends StatefulWidget {
  const GroceryItem(this.grocery, {super.key});

  final Grocery grocery;

  @override
  State<GroceryItem> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.grocery.isChecked;
  }

  void _toggleChecked(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: _toggleChecked,
              activeColor: categoryData[widget.grocery.category]!.color,
            ),
            Icon(
              categoryData[widget.grocery.category]!.icon,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.grocery.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Text(
              widget.grocery.quantity.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
