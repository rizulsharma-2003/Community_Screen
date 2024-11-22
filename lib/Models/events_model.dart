class EventModel {
  final String display;
  final String heading;
  final String title;
  final String description;
  final String dateTime;
  final String venue;
  final String responseDeadline;
  final String paymentDeadline;
  final int price;
  final String payNowLabel;

  EventModel({
    required this.display,
    required this.heading,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.venue,
    required this.responseDeadline,
    required this.paymentDeadline,
    required this.price,
    required this.payNowLabel,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      display: json['display'],
      heading: json['heading'],
      title: json['title'],
      description: json['description'],
      dateTime: json['dateTime'],
      venue: json['venue'],
      responseDeadline: json['responseDeadline'],
      paymentDeadline: json['paymentDeadline'],
      price: json['price'],
      payNowLabel: json['payNowLabel'],
    );
  }
}
