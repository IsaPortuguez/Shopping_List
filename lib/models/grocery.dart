import 'package:shopping_list/models/category.dart';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Grocery {
  Grocery({
    this.id,
    required this.name,
    required this.quantity,
    required this.category,
    this.isChecked = false,
  });

  final String? id;
  final String name;
  final int quantity;
  final Category category;
  final bool isChecked;
}
