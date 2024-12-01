import 'package:flutter/material.dart';

class learningtips extends StatefulWidget {
  learningtips({Key? key,}) : super(key: key);

  @override
  
  State<learningtips> createState() => _learningtipsState();
}
final learning = [
  {'assets/dashboard/learningtips/listing.png': 'Escuchando\nMusica'},
  {'assets/dashboard/learningtips/watching.png': 'Viendo\nPeliculas'},
  {'assets/dashboard/learningtips/recording.png': 'Grabandote\nal hablar'},
];
class _learningtipsState extends State<learningtips> {
  @override
  
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
   return Container(
    child: Stack(
      children: [
        Column(
          children: [
            Text(
              'Tips de Aprendizaje',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: learning
                .map((e) => Column(
                  children: <Widget>[    
                    Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(87, 0, 150, 135),
                        child:Image.asset(
                          e.keys.first,
                          height: screenHeight * 0.6,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      e.values.first,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ).toList(),
            )
          ],
        ),
      ],
    ),
   );
  }
}