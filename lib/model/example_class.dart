//json structure
// [
// {
// "id": "123",
// "title": "Sample Title 1",
// "details": "This is a sample detail for the first Example class.",
// "createdAt": "2025-01-22T10:00:00Z",
// "updatedAt": "2025-01-22T12:00:00Z"
// },
// {
// "id": "124",
// "title": "Sample Title 2",
// "details": "This is a sample detail for the second Example class.",
// "createdAt": "2025-01-21T09:00:00Z",
// "updatedAt": "2025-01-21T11:00:00Z"
// },
// {
// "id": "125",
// "title": "Sample Title 3",
// "details": "This is a sample detail for the third Example class.",
// "createdAt": "2025-01-20T08:00:00Z",
// "updatedAt": "2025-01-20T10:00:00Z"
// }
// ]

class ExampleClass {
  String? id, title, details, createdAt, updatedAt;

  ExampleClass({this.id, this.title, this.details, this.createdAt, this.updatedAt});

  factory ExampleClass.fromJson(Map<String, dynamic> json) {
    return ExampleClass(id: json['id'], title: json['title'], details: json['details'], createdAt: json['createdAt'], updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'details': details, 'createdAt': createdAt, 'updatedAt': updatedAt};
  }

  static List<ExampleClass> fromJsonList(List list) {
    return list.map((item) => ExampleClass.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<ExampleClass> list) {
    return list.map((item) => item.toJson()).toList();
  }
}
