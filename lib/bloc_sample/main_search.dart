import 'package:flutter/material.dart';
import 'package:flutter_element/bloc_sample/search_bloc.dart';
import 'package:flutter_element/bloc_sample/search_view.dart';
import 'package:provider/provider.dart';

class MainSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SearchBloc>.value(
      value: SearchBloc(),
      child: SearchView(),
    );
  }
}
