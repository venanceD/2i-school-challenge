import 'package:flutter/material.dart';
import 'package:sc2i/accueil.dart';
import 'package:sc2i/models/calendar.dart';
import 'package:sc2i/screens/home.dart';
import 'package:sc2i/screens/splashscreen.dart';
import 'package:sc2i/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Menu 2I SCHOOL CHALLENGE',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        body: MyMenu(),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20.0, // Espacement horizontal entre les boutons
        runSpacing: 20.0, // Espacement vertical entre les boutons
        children: <Widget>[
          SquareButton(
            icon: Icons.note_add_sharp,
            label: 'Bloc note',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreens()));
            },
          ),
          SquareButton(
            icon: Icons.book_sharp,
            label: 'Librairie',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => splashscreen()));
            },
          ),
          SquareButton(
            icon: Icons.quiz_outlined,
            label: 'Quizz',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => accueil()));
            },
          ),
        ],
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  SquareButton(
      {required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100.0, // Largeur du bouton carré
        height: 100.0, // Hauteur du bouton carré
        color: Colors.blue, // Couleur de fond du bouton
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 40.0, // Taille de l'icône
              color: Colors.white, // Couleur de l'icône
            ),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

