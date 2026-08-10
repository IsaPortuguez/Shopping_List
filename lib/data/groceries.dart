import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/models/category.dart';

final List<Grocery> groceries = [
  Grocery(
    name: 'Spinach',
    quantity: 2,
    category: Category.vegetables,
    isChecked: false,
  ),
  Grocery(
    name: 'Apples',
    quantity: 6,
    category: Category.fruits,
    isChecked: false,
  ),
  Grocery(
    name: 'Chicken Breast',
    quantity: 2,
    category: Category.meat,
    isChecked: false,
  ),
  Grocery(
    name: 'Milk',
    quantity: 2,
    category: Category.dairy,
    isChecked: false,
  ),
  Grocery(
    name: 'Bread',
    quantity: 1,
    category: Category.carbs,
    isChecked: false,
  ),
  Grocery(
    name: 'Chocolate',
    quantity: 1,
    category: Category.sweets,
    isChecked: false,
  ),
  Grocery(
    name: 'Papprika',
    quantity: 1,
    category: Category.spices,
    isChecked: false,
  ),
  Grocery(
    name: 'Pizza',
    quantity: 1,
    category: Category.convenience,
    isChecked: false,
  ),
  Grocery(
    name: 'Fuze Tea',
    quantity: 3,
    category: Category.drinks,
    isChecked: false,
  ),
  Grocery(
    name: 'Shampoo',
    quantity: 1,
    category: Category.hygiene,
    isChecked: false,
  ),
  Grocery(
    name: 'Boxes',
    quantity: 10,
    category: Category.other,
    isChecked: false,
  ),
];
