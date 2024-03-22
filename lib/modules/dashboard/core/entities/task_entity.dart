/// Entidade de uma tarefa.
class TaskEntity {
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
    return '\n { Name: $name Difficulty: $difficulty, isFinished: $isFinished } ';
  }
}
