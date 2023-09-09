import 'package:flutter/material.dart';

class Messages {
  final Map<String, Map<String, String>>? languages;
  Messages({@required this.languages});

  @override
  Map<String, Map<String, String>> get keys {
    return languages!;
  }
}
