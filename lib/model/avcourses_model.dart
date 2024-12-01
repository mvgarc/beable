class AvCoursesModel{
  String? uid;
  int part1_level1;
  int part1_level2;
  int part1_level3;


  AvCoursesModel({this.uid, this.part1_level1 = 0, this.part1_level2 = 0, this.part1_level3 = 0,});

  // receiving data from server
  factory AvCoursesModel.fromMap(map){
    return AvCoursesModel(
      uid: map['uid'],
      part1_level1: map['part1_level1'],
      part1_level2: map['part1_level3'],
      part1_level3: map['part1_level2'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'part1_level1': part1_level1,
      'part1_level2': part1_level2,
      'part1_level3': part1_level3,

    };
  }
}

