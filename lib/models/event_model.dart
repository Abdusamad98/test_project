class EventModel {
  final String title;
  final List<String> images;
  final String description;
  final String dateOfEvent;

  EventModel({
    required this.title,
    required this.description,
    required this.images,
    required this.dateOfEvent,
  });
}
