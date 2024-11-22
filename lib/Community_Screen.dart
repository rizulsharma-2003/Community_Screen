import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Constants/app_theme.dart';
import 'Models/events_model.dart';
import 'Models/notice_model.dart';
import 'Services/events_services.dart';
import 'Services/notice_services.dart';

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
int? selectedOption;
final Map<int, int> pollResults = {0: 75, 1: 15, 2: 10};

  @override
  Widget build(BuildContext context) {
    NavigationRailDestination buildNavRailDestination({
      required int index,
      required String icon,
      required String label,
    }) {
      bool isSelected = _selectedIndex == index;

      return NavigationRailDestination(
        icon: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSelected
                ? AppThemeData.lightColorScheme.primary.withOpacity(0.1)
                : AppThemeData.lightColorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? AppThemeData.lightColorScheme.primary
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 64.0,
                width: 52.0,
              ),
              const SizedBox(height: 4.0),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? AppThemeData.lightColorScheme.primary
                      : AppThemeData.lightColorScheme.scrim,
                ),
              ),
            ],
          ),
        ),
        selectedIcon: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSelected
                ? AppThemeData.lightColorScheme.surfaceTint.withOpacity(0.1)
                : AppThemeData.lightColorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? AppThemeData.lightColorScheme.surfaceTint
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 64.0,
                width: 52.0,
              ),
              const SizedBox(height: 4.0),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? AppThemeData.lightColorScheme.primary
                      : AppThemeData.lightColorScheme.surfaceTint,
                ),
              ),
            ],
          ),
        ),
        label: const SizedBox(),
      );
    }
    return Scaffold(
      backgroundColor: AppThemeData.lightColorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(57),
        child: Column(
          children: [
            AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 104,
                  height: 23,
                  child: const Text(
                    "Community",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              backgroundColor: AppThemeData.lightColorScheme.surface,
              elevation: 0,
              iconTheme: IconThemeData(color: AppThemeData.lightColorScheme.scrim),
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
                            color: AppThemeData.lightColorScheme.scrim,
                            height: 24.0,
                          ),
                        ),
                        onPressed: () {

                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Black line below the app bar
            Container(
              height: 1.0,
              color: AppThemeData.lightColorScheme.outlineVariant,
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: AppThemeData.lightColorScheme.surface,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              buildNavRailDestination(
                index: 0,
                icon: 'assets/icons/Notice.svg',
                label: 'Notice',
              ),
              buildNavRailDestination(
                index: 1,
                icon: 'assets/icons/Polls.svg',
                label: 'Polls',
              ),
              buildNavRailDestination(
                index: 2,
                icon: 'assets/icons/Events.svg',
                label: 'Events',
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Center(
                  child:
                FutureBuilder<List<Notice>>(
                  future: futureNotices,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No notices available."));
                    }

                    final notices = snapshot.data!;

                    return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: notices.length,
                      itemBuilder: (context, index) {
                        final notice = notices[index];

                        return Container(
                          width: 244,
                          height: 316,
                          margin: const EdgeInsets.only(bottom: 16.0),
                          decoration: BoxDecoration(
                            color: AppThemeData.lightColorScheme.surface,
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
                            children: [
                              SizedBox(
                                height: 60,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: CircleAvatar(
                                        radius: 14.0, // Adjust size as needed
                                        backgroundImage: AssetImage('assets/images/${notice.displayPicture}'),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Expanded(
                                        child: Text(
                                          notice.title,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppThemeData.lightColorScheme.onSurface,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ClipRRect(
                                child: Image.asset(
                                  'assets/images/${notice.image}',
                                  height: 120,
                                  width: 244,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0,right: 16),
                                child: Text(
                                  notice.description,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: AppThemeData.lightColorScheme.onSurface,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    notice.time,
                                    style: TextStyle(
                                      fontSize: 8.0,
                                      color: AppThemeData.lightColorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
               ),
                Padding(
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
                                          style: const TextStyle(fontSize: 10.0, color: Colors.black),
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
                                            backgroundColor: AppThemeData.darkColorScheme.onSurfaceVariant,
                                            minHeight: 5.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        "${pollResults[index]}%",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color:AppThemeData.lightColorScheme.onSurfaceVariant,
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
                FutureBuilder<EventModel>(
                  future: eventDetails,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      final event = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
                        child: Container(
                          width: 244,
                          height: 430,
                          decoration: BoxDecoration(
                            color: AppThemeData.lightColorScheme.surface,
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
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SizedBox(
                                  height: 28,
                                  child: Row(
                                    children: [
                                      // Display Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: CircleAvatar(
                                          radius: 14.0,
                                          backgroundImage: AssetImage('assets/images/${event.display}'),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      // Heading Text
                                      Text(
                                        event.heading,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                height: 112,
                                width: 244,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/banner.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event.title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      height: 68,
                                      child: Text(
                                        event.description,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    SizedBox(
                                      height: 58,
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Date & Time",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                event.dateTime,
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                "Venue",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 4),

                                              Text(
                                                event.venue,
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                "Response Deadline:",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                "${event.responseDeadline}",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )

                                        ],
                                      ),

                                    ),

                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "₹${event.price}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),

                                            SizedBox(
                                              height: 16,
                                              width: 48,

                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  side: BorderSide(color: AppThemeData.lightColorScheme.primary),
                                                  backgroundColor: AppThemeData.lightColorScheme.onPrimary,
                                                  foregroundColor: AppThemeData.lightColorScheme.primary,
                                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                ),
                                                onPressed: () {

                                                },
                                                child: Text(
                                                  event.payNowLabel,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                        // Payment Deadline
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Payment Deadline:",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${event.paymentDeadline}",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(child: Text("No event data available"));
                    }
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
