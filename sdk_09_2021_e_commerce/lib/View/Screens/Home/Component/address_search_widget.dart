import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/suggestion_model.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  final sessionToken;
  late PlaceApiProvider apiClient;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Suggestion.empty());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: query == ""
            ? null
            : apiClient.fetchSuggestions(
                query, Localizations.localeOf(context).languageCode),
        builder: (context, snapshot) {
          log('query : $query');
          var data = snapshot.data;
          if (query == '') {
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Enter your address'),
            );
          }
          if (data == null) {
            return Center(child: Text('Loading...'));
          }
          var result = data as List;
          log('result size : ${result.length}');
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text((result[index] as Suggestion).description!),
                onTap: () {
                  close(context, result[index] as Suggestion);
                },
              );
            },
            itemCount: result.length,
          );
        });
  }
}
