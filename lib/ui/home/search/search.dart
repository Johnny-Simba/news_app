import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(onPressed: (){

      },icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    // TODO: implement buildLeading
    return Icon(Icons.search_outlined);
  }

  @override
  Widget buildResults(BuildContext context) {

    // TODO: implement buildResults
    return ElevatedButton(onPressed: (){},
        child: Text('data res')
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // TODO: implement buildSuggestions
    return ElevatedButton(onPressed: (){

    },
        child: Text('data sss')
    );
  }
  
}