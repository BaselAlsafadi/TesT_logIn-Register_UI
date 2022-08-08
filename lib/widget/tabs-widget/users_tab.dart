import 'package:flutter/material.dart';
import 'package:flutter_app/database/database.dart';

class UsersTab extends StatefulWidget {
  String add;
  String edit;
  String delete;

  UsersTab(
      {Key? key, required this.add, required this.edit, required this.delete})
      : super(key: key);

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  @override
  void initState() {
    super.initState();
    refreshItems(); // Load data when app starts
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  bool deleteuser = false;
  bool adduser = false;
  bool edituser = false;
  String deletee = "";
  String addd = "";
  String editt = "";

  showForm(BuildContext ctx, int? itemKey) async {
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
      adduser = existingItem["add"] == "true" ? true : false;
      deleteuser = existingItem["delete"] == "true" ? true : false;
      edituser = existingItem["edit"] == "true" ? true : false;
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => StatefulBuilder(builder: (context, setStatee) {
              return Container(
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
                    Row(children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: adduser,
                        onChanged: (value) {
                          setStatee(() {
                            adduser = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Add User')
                    ]),
                    Row(children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: edituser,
                        onChanged: (value) {
                          setState(() {
                            setStatee(() {
                              edituser = value!;
                            });
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Edit User')
                    ]),
                    Row(children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: deleteuser,
                        onChanged: (value) {
                          setStatee(() {
                            deleteuser = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Delete User')
                    ]),
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
                            "number": numberController.text,
                            "add": adduser.toString(),
                            "delete": deleteuser.toString(),
                            "edit": edituser.toString()
                          });
                          setState(() {
                            refreshItems();
                          });
                        }

                        // update an existing item
                        if (itemKey != null) {
                          setState(() {
                            updateItem(itemKey, {
                              'name': nameController.text.trim(),
                              'email': emailController.text.trim(),
                              "username": usernameController.text.trim(),
                              "password": passwordController.text.trim(),
                              "number": numberController.text.trim(),
                              "add": adduser.toString(),
                              "delete": deleteuser.toString(),
                              "edit": edituser.toString()
                            });
                          });
                        }
                        setState(() {
                          refreshItems();
                        });

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
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
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
                              refreshItems();
                              setState(() {
                                widget.edit == "true"
                                    ? showForm(context, currentItem['key'])
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                                'Your Account Not Have Edite Permisson')));
                              });
                            }),
                        // Delete button
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              widget.delete == "true"
                                  ? deleteItem(currentItem['key'], _)
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Your Account Not Have Delete Permisson')));
                            }),
                      ],
                    )),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              refreshItems();
              widget.add == "true"
                  ? showForm(context, null)
                  : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Your Account Not Have Any Permisson')));
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
