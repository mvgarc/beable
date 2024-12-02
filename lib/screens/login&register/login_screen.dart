import 'dart:ffi';

import 'package:beable/screens/home_screen.dart';
import 'package:beable/screens/login&register/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key

  final _formKey = GlobalKey<FormState>();

  // editing controller

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController wrongPasswordText = TextEditingController();
  final TextEditingController wrongEmailText = TextEditingController();
  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    loginFormInfo watch = context.watch<loginFormInfo>();
    bool wrongPassword = watch.wrongPassword;
    bool wrongEmail = watch.wrongEmail;

    // email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor ingrese un correo electrónico");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por favor ingrese un correo electrónico valido");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Correo electrónico",
          // ignore: dead_code
          errorText: wrongEmail ? wrongEmailText.text : null,
          errorStyle: TextStyle(
            fontFamily: 'Arial',
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'.{6,}$');
          if (value!.isEmpty) {
            return ("Por favor ingrese una contraseña");
          }
          if (!regex.hasMatch(value)) {
            return ("Por favor ingrese una contraseña valida (Min. 6 Digitos)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          // ignore: dead_code
          errorText: wrongPassword ? wrongPasswordText.text : null,
          errorStyle: TextStyle(
            fontFamily: 'Arial',
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF0ABBB5),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(
              emailController.text,
              passwordController.text,
            );
          },
          child: Text(
            "Iniciar sesión",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child:
                          Image.asset("assets/logo.png", fit: BoxFit.contain),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("¿No tienes una cuenta?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                          child: Text(
                            " Registrarse",
                            style: TextStyle(
                              color: Color(0xFF0ABBB5),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  // login fuction
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        context.read<loginFormInfo>().setTexts8(wrongEmail: false);
        context.read<loginFormInfo>().setTexts9(wrongPassword: false);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(
                  currentIndex: 0,
                )));
      } on FirebaseAuthException catch (error) {
        print(error.code);
        if (error.code == 'user-not-found') {
          setState(() => wrongEmailText.text = 'Correo invalido');
          context.read<loginFormInfo>().setTexts8(wrongEmail: true);
        }
        if (error.code == 'wrong-password') {
          setState(() => wrongPasswordText.text = 'Contraseña invalida');
          context.read<loginFormInfo>().setTexts9(wrongPassword: true);
        }
      }
    }
  }
}

//await _auth.signInWithEmailAndPassword(email: email, password: password)
//.then((uid) => {
//Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen())),
//Fluttertoast.showToast(msg: "Sesión Iniciada"),
//}).catchError((e){
//Fluttertoast.showToast(msg: e!.message);
//});
