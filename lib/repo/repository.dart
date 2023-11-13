import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itshadits/model/book_model.dart';

class Repository {
  final _baseUrl = 'https://hadiths-brown.vercel.app/books';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('data')) {
          Iterable it = jsonResponse['data'];
          List<Book> books = it.map((e) => Book.fromJson(e)).toList();

          return books;
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
