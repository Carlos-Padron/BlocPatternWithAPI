import 'dart:convert';

import 'package:BlocPatternWithAPI/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:BlocPatternWithAPI/models/Book.dart';

class DataService {
  static final DataService dataService = DataService._internal();

  factory DataService() {
    return dataService;
  }

  DataService._internal();

  Future<List<Book>> getBooks() async {
    var response = await http.get(getBooksRoute);

    if (response.statusCode == 200) {
      var bookArray = List<Book>();
      var jsonReponse = json.decode(response.body);

      for (var book in jsonReponse) {
        var bookObj = Book.fromJson(book);
        bookArray.add(bookObj);
      }

      return bookArray;
    } else {
      //throw error
      throw Exception('Error fetching data from the internet');
    }
  }
}
