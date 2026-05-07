class CaseModel {
  final String id;
  final String category;
  final String description;
  final String date;
  final String time;
  final String status;

  const CaseModel({
    required this.id,
    required this.category,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
  });

  //When case still open
  bool get isActive => status != 'Resolved' && status != 'Closed';
}
