
class Todos{
  int userId;
  int id ;
  String title;
  bool completed;

  Todos({required this.userId, required this.id, required this.title, required this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "completed": this.completed,
    };
  }

//
}