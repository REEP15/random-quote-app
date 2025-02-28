import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<String?> fetchRandomQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['content']; 
    } else {
      return null;  
    }
  }
}
