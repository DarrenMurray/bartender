import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Alert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: 120,
        width: 120,
        child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(250, 128, 114, 100),
    ),
        child:  Text("Select a drink to order!",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 25,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 0.4,
                  color: Color.fromARGB(255, 3, 0, 0),
                )
              ],
            )),
      ),
      ),
    );
  }
}

class LoadingSpinner extends StatelessWidget{
  double progress = 0.0;

  LoadingSpinner(this.progress);

  @override
  Widget build(BuildContext context) {
    return               Center(
      child: Container(
        height: 120,
        width: 120,
        child: LiquidCircularProgressIndicator(
          value: progress,
          // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(
              Color.fromRGBO(250, 128, 114, 1)),
          // Defaults to the current Theme's accentColor.
          backgroundColor: Colors.white,
          // Defaults to the current Theme's backgroundColor.
          borderColor: Color.fromRGBO(148, 59, 65, 1),
          borderWidth: 4.0,
          direction: Axis.vertical,
          center: Text("Preparing...",
              style: GoogleFonts.niconne(
                color: Color.fromRGBO(148, 59, 65, 1),
                fontSize: 25,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 0.4,
                    color: Color.fromARGB(255, 245, 244, 244),
                  )
                ],
              )),
        ),
      ),
    );
  }
}