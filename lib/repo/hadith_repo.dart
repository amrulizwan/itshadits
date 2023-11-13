import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itshadits/model/hadith_model.dart';

class RepoHadith {
  final _baseUrl = 'https://hadiths-brown.vercel.app/books/';

  Future<List<Hadith>> getData(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + endpoint));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('data')) {
          Map<String, dynamic> data = jsonResponse['data'];
          if (data.containsKey('hadiths')) {
            List<dynamic> hadithsJson = data['hadiths'];
            List<Hadith> hadiths =
                hadithsJson.map((e) => Hadith.fromJson(e)).toList();
            return hadiths;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
