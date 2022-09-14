class Task {
  String title;
  bool isComplete;

  Task(this.title, {this.isComplete = false});

  void toggle() {
    isComplete = !isComplete;
  }
}
