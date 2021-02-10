import 'package:flutter/material.dart';
import 'package:flutter_element/bloc_sample/search_bloc.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<SearchBloc>(context);
    searchController.addListener(() {
      var query = searchController.text;
      bloc.search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, bloc, child) => Container(
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: "Search...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}
