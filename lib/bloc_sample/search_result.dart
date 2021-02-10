import 'package:flutter/material.dart';
import 'package:flutter_element/bloc_sample/search_bloc.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, bloc, child) => Container(
        child: StreamBuilder<List<String>>(
          initialData: [],
          stream: bloc.searchController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _buildRow(snapshot.data[index]);
                });
          },
        ),
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
