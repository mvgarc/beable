import 'dart:io';
import 'package:beable/screens/profile/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';


class profile_pic extends StatefulWidget {

  
  String? userId;
  String? donwloadURL_user;
  profile_pic({Key? key ,this.userId, this.donwloadURL_user}) : super(key: key);
  @override
  State<profile_pic> createState() => _profile_picState();
  
}

class _profile_picState extends State<profile_pic> {

  File? _image;
  final imagePicker = ImagePicker();
  String? donwloadURL;
  //Image Picker
  
  Future imagePickerMethod() async{
    //Picking the file

    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null){
        _image = File(pick.path);
        UploadImage();
      }
    });
    
  }
  Future UploadImage() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
      .ref()
      .child("/profiles_picture")
      .child("${widget.userId}");
    await ref.putFile((_image!));
    donwloadURL = await ref.getDownloadURL();
    
    await firebaseFirestore
    .collection("users")
    .doc(widget.userId)
    .update({"donwloadURL" : donwloadURL});
   Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => settingsScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            clipBehavior: Clip.none, fit: StackFit.expand,
            children: [
              CircleAvatar(
                radius: 60,
                
                backgroundColor: Colors.teal,
                child: CircleAvatar(
                backgroundImage: NetworkImage("${widget.donwloadURL_user}"),radius: 55.0)),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white,width: 2,)),
                      primary: Colors.teal,
                    ),
                    
                    onPressed: () async{
                     imagePickerMethod();
                    },
                    child: SvgPicture.asset("assets/settings/camera.svg",
                    color: Colors.white,),
                  ),
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}