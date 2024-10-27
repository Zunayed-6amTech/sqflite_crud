class Task {
  final int id;
  final int status;
  final String content;
  const Task({required this.id, required this.status, required this.content});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      status: json['status'] as int,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'content': content,
    };
  }
}