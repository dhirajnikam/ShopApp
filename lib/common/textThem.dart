import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTheme1 extends StatelessWidget {
  String text;
  Color color;

 
  TextTheme1({
    Key? key,
    this.text = '',
    this.color = Colors.black,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text,style: GoogleFonts.oxygen(color: color,fontSize: 26,fontWeight: FontWeight.bold),
    );
  }
}

class TextTheme2 extends StatelessWidget {
  String text;

   TextTheme2({
    Key? key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: GoogleFonts.oxygen(color: Colors.grey,fontSize: 20,),
    );
  }
}
