import 'package:flutter/material.dart';
import 'package:flutter_element/bloc_sample/search_bloc.dart';

class SearchResult extends StatefulWidget {
  final SearchBloc bloc;

  SearchResult({SearchBloc bloc}) : this.bloc = bloc;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<String>>(
        initialData: [],
        stream: widget.bloc.searchController.stream,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildRow(snapshot.data[index]);
              });
        },
      ),
    );
  }

  Widget _buildRow(String data) {
    return Container(
        padding: EdgeInsets.all(12),
        child: Text(
          data,
          style: TextStyle(fontSize: 17, color: Colors.blue),
        ));
  }
}
