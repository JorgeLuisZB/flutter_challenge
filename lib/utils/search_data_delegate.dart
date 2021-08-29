import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/widgets/list_item_widget.dart';

class SearchDataDelegate extends SearchDelegate<String> {
  final List<String> data;

  SearchDataDelegate({required this.data});

  /// Clean the text
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  /// Close the search mode
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, query),
    );
  }

  /// Display the result of the search
  @override
  Widget buildResults(BuildContext context) {
    final List<String> allData = data
        .where((data) => data.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: allData.length,
      itemBuilder: (context, index) => ListItemWidget(text: allData[index]),
    );
  }

  /// Display the suggestions items
  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> allData = data
        .where((data) => data.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: allData.length,
      itemBuilder: (context, index) => ListItemWidget(text: allData[index]),
    );
  }
}
