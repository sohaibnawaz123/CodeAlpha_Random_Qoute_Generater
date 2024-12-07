import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> generateQoute() async {
  String qouteURL = "https://api.adviceslip.com/advice";
  var res = await http.get(Uri.parse(qouteURL));
  var result = jsonDecode(res.body);
  return result['slip']['advice'];
}
