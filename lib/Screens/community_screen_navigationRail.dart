import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final ColorScheme colorScheme;

  const CommunityNavigationRail({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.colorScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      useIndicator: false,
      backgroundColor: colorScheme.surface,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: NavigationRailLabelType.all,
      destinations: [
        NavigationRailDestination(
          icon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selectedIndex == 0
                  ? colorScheme.primary.withOpacity(0.1)
                  : colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedIndex == 0
                    ? colorScheme.primary
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Notice.svg',
                  height: 64.0,
                  width: 52.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Notice',
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? colorScheme.primary
                        : colorScheme.scrim,
                  ),
                ),
              ],
            ),
          ),
          selectedIcon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selectedIndex == 0
                  ? colorScheme.surfaceTint.withOpacity(0.1)
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedIndex == 0
                    ? colorScheme.surfaceTint
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Notice.svg',
                  height: 64.0,
                  width: 52.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Notice',
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? colorScheme.primary
                        : colorScheme.surfaceTint,
                  ),
                ),
              ],
            ),
          ),
          label: const SizedBox(),
        ),
        NavigationRailDestination(
          icon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selectedIndex == 1
                  ? colorScheme.primary.withOpacity(0.1)
                  : colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedIndex == 1
                    ? colorScheme.primary
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Polls.svg',
                  height: 64.0,
                  width: 52.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Polls',
                  style: TextStyle(
                    color: selectedIndex == 1
                        ? colorScheme.primary
                        : colorScheme.scrim,
                  ),
                ),
              ],
            ),
          ),
          selectedIcon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selectedIndex == 1
                  ? colorScheme.surfaceTint.withOpacity(0.1)
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedIndex == 1
                    ? colorScheme.surfaceTint
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Polls.svg',
                  height: 64.0,
                  width: 52.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Polls',
                  style: TextStyle(
                    color: selectedIndex == 1
                        ? colorScheme.primary
                        : colorScheme.surfaceTint,
                  ),
                ),
              ],
            ),
          ),
          label: const SizedBox(),
        ),
        NavigationRailDestination(
          icon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selectedIndex == 2
                  ? colorScheme.primary.withOpacity(0.1)
                  : colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedIndex == 2
                    ? colorScheme.primary
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Events.svg',
                  height: 64.0,
                  width: 52.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Events',
                  style: TextStyle(
                    color: selectedIndex == 2
                        ? colorScheme.primary
                        : colorScheme.scrim,
                  ),
                ),
              ],
            ),
          ),
          selectedIcon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selectedIndex == 2
                  ? colorScheme.surfaceTint.withOpacity(0.1)
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedIndex == 2
                    ? colorScheme.surfaceTint
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Events.svg',
                  height: 64.0,
                  width: 52.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Events',
                  style: TextStyle(
                    color: selectedIndex == 2
                        ? colorScheme.primary
                        : colorScheme.surfaceTint,
                  ),
                ),
              ],
            ),
          ),
          label: const SizedBox(),
        ),
      ],
    );
  }
}
