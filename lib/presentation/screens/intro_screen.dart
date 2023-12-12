import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    context.go('/playerSelection');
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Color(0xFF8CE7F1),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xFF8CE7F1),
      pages: [
        PageViewModel(
          title: "Regla 1",
          body: "Aquí va la explicación de la primera regla.",
          image: _buildImage('reglas/regla1.png'),
          decoration: pageDecoration,
        ),
        // ... Repite para las reglas 2 y 3
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      next: const Icon(Icons.arrow_forward),
      done: const Text('Empezar', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.white,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      showNextButton: true,
      nextStyle: _buttonStyle(),
      doneStyle: _buttonStyle(),
      onSkip: () => _onIntroEnd(context),
      showDoneButton: true,
      controlsMargin: EdgeInsets.all(16),
      controlsPadding: EdgeInsets.all(16),
      curve: Curves.fastOutSlowIn,
    );
  }
}