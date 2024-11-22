import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/events_model.dart';

class EventService {
  Future<EventModel> fetchEventDetails() async {
    final String response = await rootBundle.loadString('assets/data/event.json');
    final data = json.decode(response);
    return EventModel.fromJson(data['event']);
  }
}
