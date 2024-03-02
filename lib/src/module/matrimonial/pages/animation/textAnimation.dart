import 'package:marquee/marquee.dart';
import 'package:strava_clone/src/boot.dart';

Widget buildMarquee() {
  return Marquee(
    text: 'This Profile is for.',
    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Color.fromARGB(255, 240, 135, 170)),
    scrollAxis: Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.start,
    blankSpace: 150.0,
    velocity: 100.0,
  //  pauseAfterRound: Duration(seconds: 1),
    showFadingOnlyWhenScrolling: true,
    fadingEdgeStartFraction: 0.1,
    fadingEdgeEndFraction: 0.1,
  //  numberOfRounds: 3,
    startPadding: 10.0,
    accelerationDuration: Duration(seconds: 2),
    accelerationCurve: Curves.linear,
   // decelerationDuration: Duration(milliseconds: 500),
    decelerationCurve: Curves.easeOut,
  );
}