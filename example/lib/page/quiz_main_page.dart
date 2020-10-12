import 'package:example/helper/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../options_list.dart';
import 'question.dart';

class QuizMainPage extends StatefulWidget {
  QuizMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuizMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Quiz",
          style: GoogleFonts.lato(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LineIndicator(),
          Expanded(child: Question()),
          Expanded(child: OptionList()),
        ],
      ),
    );
  }
}

class LineIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                  text: '1',
                  style: GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' /',
                        style: GoogleFonts.nunito(
                            fontSize: 15, color: Colors.black45)),
                    TextSpan(
                        text: ' 10',
                        style: GoogleFonts.nunito(
                            fontSize: 10, color: Colors.black45))
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 30,
              animation: true,
              lineHeight: 10.0,
              animationDuration: 1500,
              percent: 0.1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: ColoursHelper.blue(),
            ),
          ],
        ));
  }
}
