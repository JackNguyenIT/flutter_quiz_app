import 'dart:convert';

import 'package:floor/floor.dart';

class StringListConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? decode(String? databaseValue) {
    if (databaseValue != null) {
      return (jsonDecode(databaseValue) as List<dynamic>).cast<String>();
    }
    return null;
  }

  @override
  String? encode(List<String>? value) {
    return jsonEncode(value);
  }
}
