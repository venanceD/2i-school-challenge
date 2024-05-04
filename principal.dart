import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sc2i/data/list_question.dart';
import 'package:sc2i/screens/result.dart';
import 'package:sc2i/accueil.dart';

class principal extends StatefulWidget {
  const principal({super.key});

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  Color seconColor = Color(0xFF117eeb);
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/st.jpg"), fit: BoxFit.cover)),
          child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller!,
              onPageChanged: (Page) {
                setState(() {
                  isPressed = false;
                });
              },
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Question ${index + 1} /${questions.length}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 28.8),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      height: 8.0,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      questions[index].question!,
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    for (int i = 0; i < questions[index].answer!.length; i++)
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 18.0),
                        child: MaterialButton(
                          shape: StadiumBorder(),
                          color: isPressed
                              ? questions[index]
                                      .answer!
                                      .entries
                                      .toList()[i]
                                      .value
                                  ? isTrue
                                  : isWrong
                              : seconColor,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          onPressed: isPressed
                              ? () {}
                              : () {
                                  setState(() {
                                    isPressed = true;
                                  });
                                  if (questions[index]
                                      .answer!
                                      .entries
                                      .toList()[i]
                                      .value) {
                                    score += 10;
                                    print(score);
                                  }
                                },
                          child: Text(
                            questions[index].answer!.keys.toList()[i],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      OutlinedButton(
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Result(score)));
                                    }
                                  : () {
                                      _controller!.nextPage(
                                          duration: Duration(microseconds: 500),
                                          curve: Curves.linear);
                                      setState(() {
                                        isPressed = false;
                                      });
                                    }
                              : null,
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            side: BorderSide(color: Colors.orange, width: 1.0),
                          ),
                          child: Text(
                            index + 1 == questions.length
                                ? "Resultat"
                                : "Suivant",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ]),
                  ],
                );
              })),
    );
  }
}
