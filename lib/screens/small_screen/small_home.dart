import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coalescence/screens/small_screen/small_social_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'small_stats_bar.dart';
import 'package:flutter/material.dart';

class SmallHome extends StatefulWidget {
  const SmallHome({Key? key}) : super(key: key);

  @override
  _SmallHomeState createState() => _SmallHomeState();
}

class _SmallHomeState extends State<SmallHome> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final Shader linearGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFF264CAA), Color(0xFFCF85D7)],
    ).createShader(const Rect.fromLTWH(50.0, 100.0, 200.0, 250.0));
    final Shader linearGradient2 = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFF264CAA), Color(0xFFCF85D7)],
    ).createShader(const Rect.fromLTWH(10.0, 200.0, 200.0, 250.0));

    return Scaffold(
        body: SizedBox(
      height: _height,
      width: _width,
      child: Stack(children: [
        SizedBox(
          height: _height,
          width: _width,
          child: Image.asset(
            "assets/images/aaa.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: _height * 0.32,
          child: SizedBox(
            width: _width,
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.white, blurRadius: 150)]),
              child: Column(children: [
                Text("COALESCENCE'22",
                    style: TextStyle(
                        fontSize: 31,
                        fontFamily: "Dela",
                        fontWeight: FontWeight.w400,
                        foreground: Paint()..shader = linearGradient)),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText("Website Launching Soon",
                        speed: const Duration(milliseconds: 140),
                        textStyle: TextStyle(
                            fontFamily: "Goth",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            foreground: Paint()..shader = linearGradient2))
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 1,
                ),
              ]),
            ),
          ),
        ),
        Positioned(
          bottom: _height * 0.15,
          child: SizedBox(
            width: _width,
            height: _height * 0.3,
            child: const SmallStatsBar(),
          ),
        ),
        Positioned(
          bottom: _height * 0.05,
          child: SizedBox(
            width: _width,
            height: _height * 0.1,
            child: const SmallSocialIcons(),
          ),
        ),
        Positioned(
          top: _height * 0.01,
          child: SizedBox(
            width: _width * 0.995,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.white, blurRadius: 70)
                  ]),
                  height: 40,
                  width: 80,
                  child: Image.asset(
                    "assets/images/light_cel_2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (!await launch("http://celca.netlify.app/")) {
                      throw 'Could not launch the website';
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFEFE4FB)),
                    child: const Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        "Campus Ambassador",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 9.4,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
