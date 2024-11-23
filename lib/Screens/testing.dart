import 'package:flutter/material.dart';

import '../Constants/app_theme.dart';
import '../Models/events_model.dart';
import '../Services/events_services.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Future<EventModel> eventDetails;

  @override
  void initState() {
    super.initState();
    eventDetails = EventService().fetchEventDetails();
  }

  int? selectedOption;
  final Map<int, int> pollResults = {0: 75, 1: 15, 2: 10};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
        child: Container(
          width: 244,
          height: 274,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: AppThemeData.lightColorScheme.onSurfaceVariant,
                blurRadius: 0.3,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 28,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14.0,
                      backgroundImage: AssetImage('assets/images/display.jpeg'),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      "Landmark",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: AppThemeData.lightColorScheme.scrim,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 14,
                width: 166,
                child: Text(
                  "Should We Add a Gym Facility?",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: AppThemeData.lightColorScheme.scrim,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: 183,
                height: 34,
                child: Text(
                  "Are you interested in having a gym facility in the hostel?",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AppThemeData.lightColorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              if (selectedOption == null)
                Column(
                  children: List.generate(3, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedOption = index;
                        });
                      },
                      child: SizedBox(
                        width: 212,
                        height: 32,
                        child: Row(
                          children: [
                            Radio(
                              value: index,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value as int?;
                                });
                              },
                            ),
                            Flexible(
                              child: Text(
                                [
                                  "Yes, I would use it regularly",
                                  "Yes, but I might use it occasionally",
                                  "No, I don’t need it",
                                ][index],
                                style: const TextStyle(
                                    fontSize: 10.0, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              else
                Column(
                  children: List.generate(3, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          [
                            "• Yes, I would use it regularly",
                            "• Yes, but I might use it occasionally",
                            "• No, I don’t need it",
                          ][index],
                          style: TextStyle(
                            fontSize: selectedOption == index ? 9.0 : 9.0,
                            color: AppThemeData.lightColorScheme.scrim,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: LinearProgressIndicator(
                                  value: pollResults[index]! / 100,
                                  color: AppThemeData.lightColorScheme.primary,
                                  backgroundColor: AppThemeData
                                      .darkColorScheme.onSurfaceVariant,
                                  minHeight: 5.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              "${pollResults[index]}%",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: AppThemeData
                                    .lightColorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              const SizedBox(height: 6.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "11:02am",
                  style: TextStyle(
                    fontSize: 8.0,
                    color: AppThemeData.lightColorScheme.outlineVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
