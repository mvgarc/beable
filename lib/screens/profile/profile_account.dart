import 'package:beable/screens/profile/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class profileAccount extends StatefulWidget {
  String? userId;
  String? email;
  String? firstname;
  String? lastname;
  profileAccount({Key? key,this.userId, this.email, this.firstname, this.lastname }) : super(key: key);

  @override
  State<profileAccount> createState() => _profileAccountState();
}

class _profileAccountState extends State<profileAccount> {
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    firstNameEditingController.text = "${widget.firstname}";
    lastNameEditingController.text = "${widget.lastname}";
    emailEditingController.text = "${widget.email}";
    final FirstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new  RegExp(r'.{3,}$');
        if(value!.isEmpty){
          return("Por favor ingrese un nombre");
        }
        if(!regex.hasMatch(value)){
          return("Por favor ingrese un nombre valido (Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15), 
        hintText: "Nombre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ));

    // last name field 
    final LastNameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new  RegExp(r'.{2,}$');
        if(value!.isEmpty){
          return("Por favor ingrese su apellido");
        }
        if(!regex.hasMatch(value)){
          return("Por favor ingrese un apellido valido (Min. 2 Digitos)");
        }
        return null;
      },
      onSaved: (value){
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15), 
        hintText: "Apellido",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ));

    // Email field 
    final EmailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Por favor ingrese un correo electrónico");
          }
          // reg expression for email validation
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
          .hasMatch(value)) {
            return("Por favor ingrese un correo electrónico valido");
          }
          return null;
      },
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15), 
        hintText: "Correo electrónico",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ));

      final refreshbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF0ABBB5),
      child: MaterialButton(
        padding:EdgeInsets.fromLTRB(20, 15, 20, 15), 
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
          await firebaseFirestore
          .collection("users")
          .doc(widget.userId)
          .update({
            "firstName" : firstNameEditingController.text,
            "lastName" : lastNameEditingController.text,
            "email" : emailEditingController.text,});
            Fluttertoast.showToast(msg: "Cuenta actualizada correctamente)");
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => settingsScreen()));
        },
        child: Text("Actualizar" , textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),)
      ),
    );

     return Scaffold(
      appBar: AppBar(title: Text("Mi Perfil", style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold, 
        fontSize:20, ),), centerTitle: true,),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 45),
                  FirstNameField,
                  SizedBox(height: 20),
                  LastNameField,
                  SizedBox(height: 20),
                  EmailField,
                  SizedBox(height: 20),
                  refreshbutton,
            ]
          )
        )
      )
     );
  }
}