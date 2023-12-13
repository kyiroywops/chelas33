import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void _onIntroEnd(context) {
    context.go('/playerSelection');
  }

  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName', width: 350.0);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      imagePadding: EdgeInsets.zero,
      pageColor: Color(0xFF8CE7F1),
    );

    return IntroductionScreen(
      key: GlobalKey<IntroductionScreenState>(),
      pages: [
        PageViewModel(
          titleWidget: _buildTitleWidget(0),
          bodyWidget: _buildBodyWidget('Regla 1', 'Aquí va la explicación de la primera regla.', 'reglas/regla1.png'),
          decoration: pageDecoration,
        ),
        // Repite para las reglas 2 y 3
      ],
      onDone: () => _onIntroEnd(context),
      onChange: (index) {
        // Aquí podrías cambiar el estado basado en el índice de la página si fuera necesario
      },
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
      showDoneButton: true,
      globalBackgroundColor: Color(0xFF8CE7F1),
      controlsMargin: EdgeInsets.all(16),
      controlsPadding: EdgeInsets.all(16),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _buildTitleWidget(int pageIndex) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _onIntroEnd(context),
              child: Icon(Icons.close, color: Colors.black),
            ),
            if (pageIndex == 0) // Asumiendo que el logo solo se muestra en la primera página
              Image.asset('assets/images/logo.png', width: 100), // Reemplaza con tu logo
          ],
        ),
      ),
    );
  }

  Widget _buildBodyWidget(String title, String body, String imageName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100), // Espacio para el logo y la 'X'
        Text(
          title,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24), // Espacio entre el título y la imagen
        _buildImage(imageName), // La imagen de la regla
        SizedBox(height: 24), // Espacio entre la imagen y la descripción
        Text(
          body,
          style: TextStyle(fontSize: 19.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
