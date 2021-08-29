/// SelectionModel receive title as a header and data as the items
class SectionModel {
  final String title;
  final List<dynamic> data;

  SectionModel({
    required this.title,
    required this.data,
  });

  @override
  String toString() {
    return 'Section: $title, data: $data';
  }
}
