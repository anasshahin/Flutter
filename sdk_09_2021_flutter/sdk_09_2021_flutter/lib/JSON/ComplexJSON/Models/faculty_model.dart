class Faculty {
  String? name;
  List<String>? majors;
  List<Subject>? subject;

  Faculty({this.name, this.majors, this.subject});

  factory Faculty.fromJson(Map<String, dynamic> json) {
    var subject;
    if (json['subject'] != null) {
      subject = <Subject>[];
      json['subject'].forEach((v) {
        subject!.add(Subject.fromJson(v));
      });
    }
    return Faculty(
        name: json['name'],
        majors: json['majors'].cast<String>(),
        subject: subject);
  }

  Faculty.fromJson2(Map<String, dynamic> json) {
    name = json['name'];
    majors = json['majors'].cast<String>();
    if (json['subject'] != null) {
      subject = <Subject>[];
      json['subject'].forEach((v) {
        subject!.add(new Subject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['majors'] = this.majors;
    if (this.subject != null) {
      data['subject'] = this.subject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subject {
  String? subjectName;
  String? teacher;

  Subject({this.subjectName, this.teacher});

  Subject.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectName'] = this.subjectName;
    data['teacher'] = this.teacher;
    return data;
  }
}

