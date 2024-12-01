class UserModel{
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  int levelTest;
  String? donwloadURL;
  bool notification = false;

  UserModel({this.uid, this.email, this.firstName, this.lastName, this.levelTest = 0, 
  this.donwloadURL="https://firebasestorage.googleapis.com/v0/b/beable-5a816.appspot.com/o/profiles_picture%2FprofilePic.png?alt=media&token=76ba98d5-08cb-49c8-be89-c7de0954fd12",
  this.notification = false,
  });

  // receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      levelTest: map['levelTest'],
      donwloadURL: map['donwloadURL'],
      notification: map['notification'],
      
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email':email,
      'firstName': firstName,
      'lastName': lastName,
      'levelTest': levelTest,
      'donwloadURL':  donwloadURL,
      'notification':  notification,
    };
  }
}