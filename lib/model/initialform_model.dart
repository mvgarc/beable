class InitialFormModel{
  String? uid;
  String? question1;
  String? question2;
  String? question3;
  String? question4;

  InitialFormModel({this.question1, this.question2, this.question3, this.question4});

  // receiving data from server
  factory InitialFormModel.fromMap(map){
    return InitialFormModel(
      question1: map['question1'],
      question2: map['question2'],
      question3: map['question3'],
      question4: map['question4'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap(){
    return{
      'question1': question1,
      'question2': question2,
      'question3': question3,
      'question4': question4,

    };
  }
}

