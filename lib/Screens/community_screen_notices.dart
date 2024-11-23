import 'package:flutter/material.dart';

import '../Models/notice_model.dart';

class CommunityNotice extends StatelessWidget {
  const CommunityNotice({
    super.key,
    required this.futureNotices,
    required this.colorScheme,
  });

  final Future<List<Notice>> futureNotices;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: FutureBuilder<List<Notice>>(
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
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.onSurfaceVariant,
                        blurRadius: 0.3,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: CircleAvatar(
                                  radius: 14.0, // Adjust size as needed
                                  backgroundImage: AssetImage(
                                      'assets/images/${notice.displayPicture}'),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(top: 22),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        notice.title,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        child: Image.asset(
                          'assets/images/${notice.image}',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: SizedBox(
                          height: 90,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Text(
                              notice.description,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: colorScheme.onSurface,
                              ),
                            ),
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
                              color: colorScheme.onSurfaceVariant,
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
    );
  }
}
