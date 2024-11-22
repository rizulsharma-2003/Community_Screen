import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/notice_model.dart';

Future<List<Notice>> fetchNotices() async {
  final String response = await rootBundle.loadString('assets/data/notices.json');
  final List<dynamic> data = json.decode(response)['notices'];
  return data.map((json) => Notice.fromJson(json)).toList();
}
