import 'package:flutter/material.dart';

class CommunityPolls extends StatefulWidget {
  final ColorScheme colorScheme;

  const CommunityPolls({
    Key? key,
    required this.colorScheme,
  }) : super(key: key);

  @override
  State<CommunityPolls> createState() => _CommunityPollsState();
}

class _CommunityPollsState extends State<CommunityPolls> {
  int? selectedOption;
  final Map<int, int> pollResults = {0: 75, 1: 15, 2: 10};

  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions and text scaling factor
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.textScaleFactorOf(context);

    // Dynamic sizing based on screen dimensions
    double scaleWidth(double value) => value * screenWidth / 360; // Base width
    double scaleHeight(double value) =>
        value * screenHeight / 640; // Base height

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: (32.0),
          left: (16.0),
          right: (16.0),
        ),
        child: Container(
          width: scaleWidth(244),
          // Use a dynamic height
          constraints: BoxConstraints(
            minHeight: scaleHeight(274), // Minimum height
            maxHeight:
                selectedOption == null ? scaleHeight(274) : double.infinity,
          ),
          padding: EdgeInsets.all(scaleWidth(16.0)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(scaleWidth(12.0)),
            boxShadow: [
              BoxShadow(
                color: widget.colorScheme.onSurfaceVariant,
                blurRadius: scaleWidth(0.3),
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: scaleHeight(28),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: scaleWidth(14.0),
                      backgroundImage: AssetImage('assets/images/display.jpeg'),
                    ),
                    SizedBox(width: scaleWidth(8.0)),
                    Text(
                      "Landmark",
                      style: TextStyle(
                        fontSize: 14.0 * textScale,
                        fontWeight: FontWeight.bold,
                        color: widget.colorScheme.scrim,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: scaleHeight(20.0)),
              SizedBox(
                height: scaleHeight(14),
                width: scaleWidth(166),
                child: Text(
                  "Should We Add a Gym Facility?",
                  style: TextStyle(
                    fontSize: 12.0 * textScale,
                    fontWeight: FontWeight.bold,
                    color: widget.colorScheme.scrim,
                  ),
                ),
              ),
              SizedBox(height: scaleHeight(8.0)),
              SizedBox(
                width: scaleWidth(183),
                height: scaleHeight(34),
                child: Text(
                  "Are you interested in having a gym facility in the hostel?",
                  style: TextStyle(
                    fontSize: 12.0 * textScale,
                    color: widget.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              SizedBox(height: scaleHeight(16.0)),
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
                        width: scaleWidth(212),
                        height: scaleHeight(32),
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
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              else
                IntrinsicHeight(
                  child: Column(
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
                              fontSize: 12.0,
                              color: widget.colorScheme.scrim,
                            ),
                          ),
                          SizedBox(height: scaleHeight(8.0)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(scaleWidth(20.0)),
                                  child: LinearProgressIndicator(
                                    value: pollResults[index]! / 100,
                                    color: widget.colorScheme.primary,
                                    backgroundColor: widget
                                        .colorScheme.onSurfaceVariant
                                        .withOpacity(0.2),
                                    minHeight: scaleHeight(5.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: scaleWidth(8.0)),
                              Text(
                                "${pollResults[index]}%",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: widget.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              SizedBox(height: scaleHeight(6.0)),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "11:02am",
                  style: TextStyle(
                    fontSize: 8.0 * textScale,
                    color: widget.colorScheme.outlineVariant,
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
