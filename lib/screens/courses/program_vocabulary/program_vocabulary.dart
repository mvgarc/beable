import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_intro_screen.dart';
import 'package:beable/screens/home_screen.dart';
import 'package:flutter/material.dart';
class program_vocabulary extends StatefulWidget {
  program_vocabulary({Key? key}) : super(key: key);

  @override
  State<program_vocabulary> createState() => _program_vocabularyState();
}
Widget levelcustom(BuildContext context, {required String level,required String img, required Widget link,}) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.all(Radius.circular(140.0)),
        child: InkWell(  
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => link));
          },
          child: Ink(      
            decoration: BoxDecoration(
              
              border: Border.all(
                color: Colors.grey,
                width: 4,
              ),
              borderRadius: BorderRadius.all(Radius.circular(140.0)),
            ),
            height: 140,
            width: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('assets/courses/$img',height: 100,),
                        Text(
                        level,
                        style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 201, 131, 83))
                      ),
                    ]),
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget sectionCustom(BuildContext context, {required String level,required String img, required Widget link,}) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: InkWell(  
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => link));
          },
          child: Ink(      
            decoration: BoxDecoration(
              
              border: Border.all(
                color: Colors.grey,
                width: 4,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            height: 140,
            width: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('assets/courses/$img',height: 100,),
                        Text(
                        level,
                        style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 201, 131, 83))
                      ),
                    ]),
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
class _program_vocabularyState extends State<program_vocabulary> {
  @override
    Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

     return Scaffold(
      appBar: AppBar(
        title: Text("Vocabulario de Programación", 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, 
            fontSize:20, ),), 
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(currentIndex: 1,))),
        ), ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/courses/wall.png"),
            fit: BoxFit.cover,
          )),
        child: Column(
          children: <Widget>[
           
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        levelcustom(context, level: 'Nivel 1', img: 'part3_level1.png', link: tv_intro()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            levelcustom(context, level: 'Nivel 2', img: 'part3_level2.png', link: tv_intro()),
                            levelcustom(context, level: 'Nivel 3', img: 'part3_level3.png', link: tv_intro()),
                          ],
                        ),
                        sectionCustom(context, level: 'Sección 1', img: 'section3.png', link: tv_intro()),
                        levelcustom(context, level: 'Nivel 1', img: 'part1_level1.png', link: tv_intro()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            levelcustom(context, level: 'Nivel 2', img: 'part2_level2.png', link: tv_intro()),
                            levelcustom(context, level: 'Nivel 3', img: 'part2_level3.png', link: tv_intro()),
                          ],
                        ),
                        sectionCustom(context, level: 'Sección 2', img: 'section2.png', link: tv_intro()),
                        levelcustom(context, level: 'Nivel 1', img: 'part1_level1.png', link: tv_intro()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            levelcustom(context, level: 'Nivel 2', img: 'part1_level2.png', link: tv_intro()),
                            levelcustom(context, level: 'Nivel 3', img: 'part1_level3.png', link: tv_intro()),
                          ],
                        ),
                        sectionCustom(context, level: 'Sección 3', img: 'section1.png', link: tv_intro()),
                        
                        
                     
                        
             
                      ]),
                    
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    ); 
  } 
}