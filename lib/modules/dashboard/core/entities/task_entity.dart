/// Entidade de uma tarefa.
class TaskEntity {
  late String id;

  final String name;

  final int difficulty;

  final bool isFinished;

  final String img;

  TaskEntity({
    required this.name,
    required this.difficulty,
    required this.isFinished,
    this.img = '/assets/images/default_flutter_image.png',
  });

  @override
  String toString() {
    return '\n {Id: $id Name: $name Difficulty: $difficulty isFinished: $isFinished } ';
  }

  void setId(String id) {
    this.id = id;
  }
}
