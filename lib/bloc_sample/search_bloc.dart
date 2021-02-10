import 'dart:async';

class SearchBloc {
  var data = [
    "Android",
    'iOS',
    "Golang",
    "PHP",
    "Flutter",
    "Python",
    "Ruby",
    "ReactJS"
  ];

  StreamController<List<String>> searchController =
      StreamController<List<String>>();

  search(String query) {
    // print(query);
    if (query.isEmpty) {
      searchController.sink.add(data);
      return;
    }

    _filter(query).then((result) => {searchController.sink.add(result)});
  }

  Future<List<String>> _filter(String query) {
    var c = Completer<List<String>>();
    List<String> result = [];
    data.forEach((value) {
      if (value.toLowerCase().contains(query.toLowerCase())) {
        result.add(value);
      }
    });
    c.complete(result);
    return c.future;
  }

  dispose() {
    searchController.close();
  }
}
