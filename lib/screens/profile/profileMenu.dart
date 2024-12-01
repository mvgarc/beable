import 'package:flutter/material.dart';

class profileMenu extends StatelessWidget {
  const profileMenu({
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.white)),
          primary: Color(0xFFF5F6F9),
          
          ),
          
          onPressed: press,
          child: Row(
            children: [
              Icon(
              icon,
              color: Colors.teal,
              size:30),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16,
                  color: Colors.black,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_right,
              size: 30,
              color: Colors.black,)
            ],)
          
        ),
                
    
    );
  }
}