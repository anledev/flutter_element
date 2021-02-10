import 'package:flutter/material.dart';
import 'package:flutter_element/bloc_sample/search_bloc.dart';
import 'package:flutter_element/bloc_sample/search_box.dart';
import 'package:flutter_element/bloc_sample/search_result.dart';

class SearchView extends StatelessWidget {
  final SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SearchBox(
            bloc: searchBloc,
          ),
          Expanded(
            child: SearchResult(
              bloc: searchBloc,
            ),
          ),
        ],
      ),
    );
  }
}
