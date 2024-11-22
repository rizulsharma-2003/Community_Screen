class Notice {
  final String title;
  final String image;
  final String description;
  final String time;
  final String displayPicture; // Added display_picture field

  Notice({
    required this.title,
    required this.image,
    required this.description,
    required this.time,
    required this.displayPicture, // Added to constructor
  });

  // Factory method to create a Notice from JSON
  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'],
      image: json['image'],
      description: json['description'],
      time: json['time'],
      displayPicture: json['display_picture'], // Parse the new field
    );
  }
}
