class Subject {
  String name;
  String grade;
  String coefficient;

  Subject({
    required this.name,
    required this.grade,
    required this.coefficient,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'],
      grade: json["grade"],
      coefficient: json['coefficient'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'grade': grade,
      'coefficient': coefficient,
    };
  }
}

class Subjects {
  List<Subject> subjects;

  Subjects({
    required this.subjects,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return Subjects(
      subjects:
          List<Subject>.from(json['subjects']?.map((x) => Subject.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjects': subjects.map((x) => x.toJson()).toList(),
    };
  }

  void addRow(Map<String, dynamic> dataMap) {
    Subject newSubject = Subject(
        name: dataMap["name"],
        grade: dataMap["grade"],
        coefficient: dataMap["coefficient"]);
    subjects.add(newSubject);
  }
}
