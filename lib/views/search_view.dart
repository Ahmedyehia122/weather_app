import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextFormField(
            decoration: const InputDecoration(
                hintText: 'Enter a city..',
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                enabled: true,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
