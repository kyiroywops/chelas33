import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void _onIntroEnd() {
  GoRouter.of(context).go('/playerSelection');
}
 


Widget _buildImage(String assetName) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(95.0), // Aumenta este valor para bordes más redondeados
    child: Image.asset('assets/images/$assetName', width: 350.0),
  );
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
          bodyWidget: _buildBodyWidget('¿Como se juega?', 'Al juntar las 4 Kaisers en la partida se termina el juego.', 'reglas/regla2.png'),
          decoration: pageDecoration,
        ),
         PageViewModel(
          titleWidget: _buildTitleWidget(0),
          bodyWidget: _buildBodyWidget('Regla 2', 'Aquí va la explicación de la primera regla.', 'reglas/regla1.png'),
          decoration: pageDecoration,
        ),
         PageViewModel(
          titleWidget: _buildTitleWidget(0),
          bodyWidget: _buildBodyWidget('Regla 3', 'Aquí va la explicación de la primera regla.', 'reglas/regla3.png'),
          decoration: pageDecoration,
        ),
        // Repite para las reglas 2 y 3
      ],
      onDone: () => _onIntroEnd(),
      onChange: (index) {
        // Aquí podrías cambiar el estado basado en el índice de la página si fuera necesario
      },
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.black), // Cambia el color y el estilo según el diseño
      ),
      showSkipButton: false,
      next: Container(
        width: 300, // Ancho del botón
        height: 50, // Altura del botón
        decoration: BoxDecoration(
          color: Colors.black, // Color de fondo del botón
          borderRadius: BorderRadius.circular(30), // Esquinas redondeadas del botón
        ),
        child: const Center(
          child: Text(
            'Siguiente',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Color del texto
            ),
          ),
        ),
      ),
      done: Container(
        width: 110, // Ancho del botón
        height: 50, // Altura del botón
        decoration: BoxDecoration(
          color: Colors.black, // Color de fondo del botón
          borderRadius: BorderRadius.circular(30), // Esquinas redondeadas del botón
        ),
        child: Center(
          child: Text(
            'Empezar',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Color del texto
            ),
          ),
        ),
      ),
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
              onTap: () => _onIntroEnd(),
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
        Text(
          title,
          style: TextStyle(
            fontSize: 28.0, 
            fontWeight: FontWeight.w900,
            fontFamily: 'ReadexPro'
            
            
            
            ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24), // Espacio entre el título y la imagen
        _buildImage(imageName), // La imagen de la regla
        SizedBox(height: 24), // Espacio entre la imagen y la descripción
        Text(
          body,
          style: TextStyle(
            fontSize: 19.0,
            fontFamily: 'ReadexPro',
            fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
         SizedBox(height: 24), // Ajusta este espacio según tus necesidades
         // Agrega el botón aquí
      ],
    );
  }
}

