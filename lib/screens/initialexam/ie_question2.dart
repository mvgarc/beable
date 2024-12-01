import 'package:beable/providers/initialform_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/initialform_provider.dart';

class question2 extends StatefulWidget {
  question2({Key? key}) : super(key: key);

  @override
  State<question2> createState() => _question2State();
}

class _question2State extends State<question2> {
  int selected_step = 0;
  Widget customRadioBorder(int index, {required String text, required IconData icon}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<InitialFormInfo>().setTexts2(value2 : text);
          setState(() => selected_step = index);
        },
        
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: selected_step == index ? Colors.blue : Colors.black38,
              width: 2,
            ),
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
                  color: selected_step == index ? Colors.blue : Colors.black38,
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
                    color: selected_step == index ? Colors.blue : Colors.black38,)
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
            child: Text('¿En que nivel de ingles te encuentras?',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            
          ),
        SizedBox(height: 30),
        customRadioBorder(1, text: "Inicial", icon:  Icons.filter_1_rounded),
        SizedBox(height: 30),
        customRadioBorder(2, text: "Intermedio", icon:  Icons.filter_2_rounded),
        SizedBox(height: 30),
        customRadioBorder(3, text: "Avanzado", icon:  Icons.filter_3_rounded ),
        SizedBox(height: 30),
        ],
    );
  }
}