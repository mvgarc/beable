class TvCoursesModel{
  String? uid;
  int intro;
  int part1_level1;
  int part1_level2;
  int part1_level3;


  TvCoursesModel({this.uid, this.intro = 0, this.part1_level1 = 0, this.part1_level2 = 0, this.part1_level3 = 0,});

  // receiving data from server
  factory TvCoursesModel.fromMap(map){
    return TvCoursesModel(
      uid: map['uid'],
      intro: map['intro'],
      part1_level1: map['part1_level1'],
      part1_level2: map['part1_level3'],
      part1_level3: map['part1_level2'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'intro': intro,
      'part1_level1': part1_level1,
      'part1_level2': part1_level2,
      'part1_level3': part1_level3,

    };
  }
}

