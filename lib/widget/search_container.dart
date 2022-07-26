import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
          decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Search here..',
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.grey[200]!, width: 2.0)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.brown, width: 2.0),
        ),
        constraints: const BoxConstraints(maxHeight: 50),
        prefixIcon: const Icon(Icons.search),
      )),
    );
  }
}
