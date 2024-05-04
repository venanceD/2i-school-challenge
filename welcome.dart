import 'package:flutter/material.dart';
import 'package:sc2i/accueil.dart';
import 'package:sc2i/models/menu.dart';
import 'anim.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              anim(
                  delay: 1500,
                  child: Container(
                    height: 60,
                    child: Text(
                      "2I CHALLENGE SCHOOL INFORMATIQUE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              anim(
                  delay: 2500,
                  child: Container(
                    height: 170,
                    child: Image.asset('images/2il2.jpeg'),
                  )),
              anim(
                  delay: 3500,
                  child: Container(
                    height: 400,
                    child: Image.asset('images/fille.png'),
                  )),
              anim(
                  delay: 4500,
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 70),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(15)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ));
                          },
                          child: Text("COMMENCE",style:TextStyle(color: Colors.white),)))),
            ],
          ),
        ),
      ),
    );
  }
}
