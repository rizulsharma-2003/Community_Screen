import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/app_theme.dart';
import '../Models/events_model.dart';
import '../Services/events_services.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Future<EventModel> eventDetails;
  int _selectedIndex = 0;// To track the selected index of the navigation rail


  @override
  void initState() {
    super.initState();
    eventDetails = EventService().fetchEventDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:NavigationRail(
        backgroundColor: AppThemeData.lightColorScheme.surface,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelType: NavigationRailLabelType.all,
        destinations: [
          _buildNavRailDestination(
            index: 0,
            icon: 'assets/icons/Notice.svg',
            label: 'Notice',
          ),
          _buildNavRailDestination(
            index: 1,
            icon: 'assets/icons/Polls.svg',
            label: 'Polls',
          ),
          _buildNavRailDestination(
            index: 2,
            icon: 'assets/icons/Events.svg',
            label: 'Events',
          ),
        ],
      ),


    );
  }

  NavigationRailDestination _buildNavRailDestination({
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
              ? AppThemeData.lightColorScheme.primary.withOpacity(0.1) // Light background for selected using primary color
              : AppThemeData.lightColorScheme.onPrimary, // Background for unselected using onPrimary color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: Border.all(
            color: isSelected
                ? AppThemeData.lightColorScheme.primary // Border color for selected using primary color
                : Colors.transparent, // No border for unselected
            width: 1.5, // Border thickness
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
                    ? AppThemeData.lightColorScheme.primary // Text color for selected using primary color
                    : AppThemeData.lightColorScheme.scrim, // Text color for unselected using surfaceTint
              ),
            ),
          ],
        ),
      ),
      selectedIcon: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? AppThemeData.lightColorScheme.surfaceTint.withOpacity(0.1) // Light background for selected using primary color
              : AppThemeData.lightColorScheme.primaryContainer, // Background for unselected using onPrimary color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: Border.all(
            color: isSelected
                ? AppThemeData.lightColorScheme.surfaceTint // Border color for selected using primary color
                : Colors.transparent, // No border for unselected
            width: 1.5, // Border thickness
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
                    ? AppThemeData.lightColorScheme.primary // Text color for selected using primary color
                    : AppThemeData.lightColorScheme.surfaceTint, // Text color for unselected using surfaceTint
              ),
            ),
          ],
        ),
      ),
      label: const SizedBox(), // Remove separate label as text is inside the container now
    );
  }
}
