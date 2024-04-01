/// Entidade de uma tarefa.
class TaskEntity {
  late String id;

  final String name;

  final int difficulty;

  final bool isFinished;

  TaskEntity(
      {required this.name,
      required this.difficulty,
      required this.isFinished,
      this.id = ''});

  @override
  String toString() {
    return '\n {Id: $id Name: $name Difficulty: $difficulty isFinished: $isFinished } ';
  }

  void setId(String id) {
    this.id = id;
  }
}
