import 'package:flutter/material.dart';
class  CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms=["hero","movie","tv shows","popular",
      " movies","top rated movies"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query="";
          },
          icon: Icon(Icons.clear))
    ];
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            close(context, null);
          },
          );

    throw UnimplementedError();}

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery=[];
    for (var movie in searchTerms){
      if(movie.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(movie);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
        }
    );
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery=[];
    for (var movie in searchTerms){
      if(movie.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(movie);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context,index){
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}