import 'package:beable/providers/initialform_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/initialform_provider.dart';

class question3 extends StatefulWidget {
  const question3({super.key});

  @override
  State<question3> createState() => _question3State();
}

class _question3State extends State<question3> {
  int selected_step = 0;
  Widget customRadio(int index,
      {required String text, required IconData icon}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<InitialFormInfo>().setTexts3(value3: text);
          setState(() => selected_step = index);
        },
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.teal,
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
                  child: Text(text,
                      style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 20,
                        color: selected_step == index
                            ? Colors.white
                            : Colors.black38,
                      )),
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
      children: [
        Title(
          color: Colors.black,
          child: Text(
            '¿Cuales son tus intereses en aprender ingles?',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        customRadio(1,
            text: "Amigos y familia", icon: FontAwesomeIcons.peopleGroup),
        SizedBox(height: 20),
        customRadio(2, text: "Cultura", icon: FontAwesomeIcons.handDots),
        SizedBox(height: 20),
        customRadio(3, text: "Turismo", icon: FontAwesomeIcons.earthAmericas),
        SizedBox(height: 20),
        customRadio(4, text: "Trabajo", icon: Icons.work),
        SizedBox(height: 20),
        customRadio(5, text: "Estudios", icon: FontAwesomeIcons.book),
        SizedBox(height: 20),
        customRadio(6, text: "Otros", icon: Icons.more_horiz),
      ],
    );
  }
}
