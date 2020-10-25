import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(
          'Corey Anderson who has hit the fastest ODI century in 36 balls is from',
          style: GoogleFonts.nunito(fontSize: 45),
        ),
      ),
    );
  }
}
