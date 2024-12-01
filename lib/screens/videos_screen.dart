import 'package:flutter/material.dart';

// ignore: camel_case_types
class vliveScreen extends StatefulWidget {
  vliveScreen({Key? key}) : super(key: key);

  @override
  State<vliveScreen> createState() => _vliveScreenState();
}

final List <String> nombres=[
  'Cursos\nGeneral',
  'Cursos\nTOEFL',
  'Cursos\nUniversidad',
  'Cursos\nAnimales',
  'Cursos\nCocina',
  'Cursos\nProgramación',
];
final List <String> imagenes=[
  'assets/videos/general.png',
  'assets/videos/toefl.png',
  'assets/videos/university.png',
  'assets/videos/animals.png',
  'assets/videos/kitchen.png',
  'assets/videos/program.png',
];

class _vliveScreenState extends State<vliveScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/videos/top_header.png'),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              
              children: [ 
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top:80),
                  child: Text(
                    "Videos",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0F17ad).withOpacity(0.90),
                        Color(0xFF6985e8).withOpacity(0.90),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: Color(0xFF6985e8).withOpacity(0.2),
                      )
                    ]
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top:25, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TOEFL",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFFF4F5FD)
                        ),),
                        SizedBox(height: 5,),
                        Text("Preparate viendo",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFF4F5FD)
                        ),),
                        SizedBox(height: 5,),
                        Text("N uestros cursos",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFF4F5FD)
                        ),),
                        SizedBox(height: 25,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer_outlined, size: 20, color: Colors.white),
                                SizedBox(width: 10,),
                                Text("35min", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                                
                              ],
                            ),
                            Expanded(child: Container(),),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF0F17ad),
                                    blurRadius: 10,
                                    offset: Offset(4, 4)
                                  )
                                ]
                              ),
                              child: Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 60,
                              ),
                            )
                          ],
                        ),
                    ]
                  ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top:30),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/videos/banner.png"),
                            fit: BoxFit.fill,
                          ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            offset: Offset(8,10),
                            color: Color(0xFF6985e8).withOpacity(0.3)
                          ),
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(-1,-5),
                            color: Color(0xFF6985e8).withOpacity(0.3)
                          )
                        ]
                        ),   
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left:50,right: 200,),
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/videos/figure.png"),
                          ),                  
                        ),    
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        margin: const EdgeInsets.only(left: 185,top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lo estas haciendo bien",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF6588F4)
                            ),),
                            SizedBox(height: 10,),
                            Text("¡Sigue asi!",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),)
                          ]),                       
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(   
                  children: [
                    Text("Cursos disponibles",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),)
                ],),
                Expanded(child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: (nombres.length.toDouble()/2).toInt(),
                      itemBuilder: (_, i) {
                        int a = 2*i;
                        int b = 2*i + 1;
                        return Row(
                          children: [
                            Container(
                              height: 150,
                              width: (MediaQuery.of(context).size.width-90)/2,
                              margin: EdgeInsets.only(left: 30, bottom: 15, top:15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(imagenes[a]),
                                
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5,5),
                                    color: Color(0xFF6985e8).withOpacity(0.1)
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5,-5),
                                    color: Color(0xFF6985e8).withOpacity(0.1)
                                  )
                                ]
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    
                                    nombres[a],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF6588F4)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              width: (MediaQuery.of(context).size.width-90)/2,
                              margin: EdgeInsets.only(left: 30, bottom: 15, top:15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(imagenes[b]),
                                  
                                  
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5,5),
                                    color: Color(0xFF6985e8).withOpacity(0.1)
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5,-5),
                                    color: Color(0xFF6985e8).withOpacity(0.1)
                                  )
                                ]
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    
                                    nombres[b],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF6588F4)
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ) ;
                      },
                    ),
                  ),
                ),)
              ]
            ),
          )
        ]
      )
    );
  }
}