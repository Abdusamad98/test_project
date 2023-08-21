class EventModel {
  final String title;
  final String description;
  final String dateOfEvent;
  final List<String> images;

  EventModel({
    required this.dateOfEvent,
    required this.description,
    required this.images,
    required this.title,
  });
}
