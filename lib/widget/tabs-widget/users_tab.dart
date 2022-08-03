import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UsersTab extends StatefulWidget {
  final String email;
  const UsersTab({Key? key, required this.email}) : super(key: key);

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  List<Map<String, dynamic>> items = [];
  final usersBox = Hive.box('Users_box');

  @override
  void initState() {
    super.initState();

    _refreshItems(); // Load data when app starts
  }

  // Get all items from the database
  void _refreshItems() {
    final data = usersBox.keys.map((key) {
      final value = usersBox.get(key);
      return {
        "key": key,
        "name": value["name"],
        "username": value['username'],
        "email": value['email'],
        "password": value['password'],
        "number": value['number']
      };
    }).toList();

    setState(() {
      items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  // Create new item
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await usersBox.add(newItem);
    _refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key
  // Our app won't use this function but I put it here for your reference
  Map<String, dynamic> readItem(int key) {
    final item = usersBox.get(key);
    return item;
  }

  // Update a single item
  Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
    await usersBox.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> deleteItem(int itemKey) async {
    await usersBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  // TextFields' controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void showForm(BuildContext ctx, int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
          items.firstWhere((element) => element['key'] == itemKey);
      nameController.text = existingItem['name'];
      usernameController.text = existingItem['username'];
      emailController.text = existingItem['email'];
      passwordController.text = existingItem['password'];
      numberController.text = existingItem['number'];
    }
    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'username'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'email'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Number'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new item
                      if (itemKey == null) {
                        createItem({
                          "name": nameController.text,
                          "email": emailController.text,
                          "username": usernameController.text,
                          "password": passwordController.text,
                          "number": numberController.text
                        });
                      }

                      // update an existing item
                      if (itemKey != null) {
                        updateItem(itemKey, {
                          'name': nameController.text.trim(),
                          'email': emailController.text.trim(),
                          "username": usernameController.text.trim(),
                          "password": passwordController.text.trim(),
                          "number": numberController.text.trim()
                        });
                      }

                      // Clear the text fields
                      nameController.text = '';
                      emailController.text = '';
                      usernameController.text = '';
                      passwordController.text = '';
                      numberController.text = '';

                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    child: Text(itemKey == null ? 'Create New' : 'Update'),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            // the list of items
            itemCount: items.length,
            itemBuilder: (_, index) {
              final currentItem = items[index];
              return Card(
                color: Colors.orange.shade100,
                margin: const EdgeInsets.all(10),
                elevation: 3,
                child: ListTile(
                    title: Text(currentItem['name']),
                    subtitle: Text(currentItem['username'].toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit button
                        IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                currentItem['email'] == widget.email
                                    ? showForm(context, currentItem['key'])
                                    : showForm(context, currentItem['key']);
                              });
                            }),
                        // Delete button
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              widget.email == 'Basel@gmail.com'
                                  ? deleteItem(currentItem['key'])
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Your Account Not Have Any Permisson')));
                            }),
                      ],
                    )),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.email == "Basel@gmail.com"
                ? showForm(context, null)
                : widget.email == "Fahed@gmail.com"
                    ? showForm(context, null)
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Your Account Not Have Any Permisson')));
          },
          child: const Icon(Icons.add),
        ));
  }
}
