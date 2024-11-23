import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Models/events_model.dart';
import '../Models/notice_model.dart';
import '../Services/events_services.dart';
import '../Services/notice_services.dart';
import 'community_screen_events.dart';
import 'community_screen_navigationRail.dart';
import 'community_screen_notices.dart';
import 'community_screen_polls.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Future<List<Notice>> futureNotices;
  int _selectedIndex = 0;
  late Future<EventModel> eventDetails;

  @override
  void initState() {
    super.initState();
    futureNotices = fetchNotices();
    eventDetails = EventService().fetchEventDetails();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: Column(
          children: [
            AppBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 104,
                  height: 23,
                  child: Text(
                    "Community",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              backgroundColor: colorScheme.surface,
              elevation: 0,
              iconTheme: IconThemeData(color: colorScheme.scrim),
              actions: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: IconButton(
                        icon: Badge.count(
                          count: 2,
                          child: SvgPicture.asset(
                            'assets/icons/notification.svg',
                            color: colorScheme.scrim,
                            height: 24.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Black line below the app bar
            Container(
              height: 1.0,
              color: colorScheme.onSurfaceVariant.withOpacity(0.2),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          CommunityNavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            colorScheme: colorScheme,
          ),
          VerticalDivider(
            width: 1,
            color: colorScheme.onSurfaceVariant
                .withOpacity(0.2), // Or any color from your colorScheme
          ),
          // Ensuring Expanded only wraps the body content inside Row
          Expanded(
            child: _selectedIndex == 0
                ? CommunityNotice(
                    futureNotices: futureNotices,
                    colorScheme: colorScheme,
                  )
                : _selectedIndex == 1
                    ? CommunityPolls(
                        colorScheme: colorScheme,
                      )
                    : _selectedIndex == 2
                        ? CommunityEvents(
                            eventDetails: eventDetails,
                            colorScheme: colorScheme,
                          )
                        : Center(
                            child: Text(
                              "Invalid selection",
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ),
          ),
        ],
      ),
    );
  }
}
