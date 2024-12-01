import 'package:beable/providers/initialform_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/initialform_provider.dart';
class question1 extends StatefulWidget {
  @override
  State<question1> createState() => _question1State();
}

class _question1State extends State<question1> {
  int selected_step = 0;
  Widget customRadio(int index, {required String text, required IconData icon}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<InitialFormInfo>().setTexts1(value1 : text);
          setState(() => selected_step = index);
        },      
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: 50),
               SizedBox(
                width: 50.0,
                child: Icon(
                  icon,
                  color: selected_step == index ? Colors.white : Colors.black38,
                  size: 25.0,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontSize: 20,
                    color: selected_step  == index ? Colors.white : Colors.black38,)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          
          Title(
            color: Colors.black, 
            child: Text('¿Como te enteraste de BeAble?',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            
          ),
        SizedBox(height: 30),
        customRadio(1, text: "Youtube", icon:  FontAwesomeIcons.youtube),
        SizedBox(height: 30),
        customRadio(2, text: "Trabajo de Grado", icon:  FontAwesomeIcons.book),
        SizedBox(height: 30),
        customRadio(3, text: "Google", icon:  FontAwesomeIcons.google),
        SizedBox(height: 30),
        customRadio(4, text: "Instagram", icon: FontAwesomeIcons.instagram),
        SizedBox(height: 30),
        customRadio(5, text: "Otros", icon:  Icons.more_horiz),
        ],
        
 

    
    );
  }
}