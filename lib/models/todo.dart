class Todo {
  final String id;
  final String title;
  final String description;
  final String category;
  bool isDone;

  Todo({this.id, this.title, this.description, this.isDone = false, this.category = 'general'});
}