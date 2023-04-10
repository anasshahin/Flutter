class Student {
  String? studentId;
  String? studentName;
  int? studentScores;

  Student({this.studentId, this.studentName, this.studentScores});

  factory Student.fromJson(Map<String, dynamic> parsedJson){
    return Student(
        studentId: parsedJson['id'],
        studentName : parsedJson['name'],
        studentScores : parsedJson ['score']
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    // Map<String,dynamic> data = Map<String,dynamic>();
    data['studentId'] = studentId;
    data['studentName'] = studentName;
    data['studentScores'] = studentScores;
    return data;
  }



}

