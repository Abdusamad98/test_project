class EventModel {
  final String title;
  final String description;
  final List<String> images;
  final String dateOfEvent;

  EventModel({
    required this.description,
    required this.dateOfEvent,
    required this.title,
    required this.images,
  });
}