import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

List<Map<String, dynamic>> items = [];
final usersBox = Hive.box('Users_box');

// Get all items from the database
refreshItems() {
  final data = usersBox.keys.map((key) {
    final value = usersBox.get(key);

    return {
      "key": key,
      "name": value["name"],
      "username": value['username'],
      "email": value['email'],
      "password": value['password'],
      "number": value['number'],
      "edit": value["edit"],
      "delete": value["delete"],
      "add": value["add"],
    };
  }).toList();
  items = data.reversed.toList();
}

// Create new item
Future<void> createItem(Map<String, dynamic> newItem) async {
  await usersBox.add(newItem);

  refreshItems(); // update the UI
}

// Retrieve a single item from the database by using its key
Map<String, dynamic> readItem(int key) {
  final item = usersBox.get(key);
  return item;
}

// Update a single item
Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
  await usersBox.put(itemKey, item);
  refreshItems(); // Update the UI
}

// Delete a single item
Future<void> deleteItem(int itemKey, BuildContext _) async {
  await usersBox.delete(itemKey);
  refreshItems();

  // Display a snackbar
  ScaffoldMessenger.of(_)
      .showSnackBar(const SnackBar(content: Text('An item has been deleted')));
}
