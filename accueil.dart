import 'package:flutter/material.dart';
import 'package:sc2i/accueil.dart';
import 'package:sc2i/constant.dart';
import 'package:sc2i/principal.dart';

class accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/2ib.jpg"), fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              "2I CHALLENGE SCHOOL",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.blue.shade900, fontWeight: FontWeight.bold),
            ),
            Text(
              "Entrer vos Informations",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Spacer(),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFFFFFF),
                hintText: "Nom Complet",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => principal()));
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  "Commencer le QUIZZ",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    ));
  }
}
