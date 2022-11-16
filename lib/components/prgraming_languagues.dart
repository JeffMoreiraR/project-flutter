import 'package:consolidando_aprendizado/components/difficulty.dart';
import 'package:flutter/material.dart';

class ProgrammingLanguages extends StatefulWidget {
  final String programmingLanguage;
  final String logoImage;
  final int difficulty;

  const ProgrammingLanguages(
      this.programmingLanguage, this.logoImage, this.difficulty,
      {Key? key})
      : super(key: key);

  @override
  State<ProgrammingLanguages> createState() => _ProgrammingLanguagesState();
}

class _ProgrammingLanguagesState extends State<ProgrammingLanguages> {
  int cont = 0;

  bool imageVerify() {
    if (widget.logoImage.contains("http")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 150,
          ),
          Column(
            children: [
              Container(
                color: const Color.fromRGBO(29, 184, 112, 20),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 75,
                        height: 100,
                        child: !imageVerify()
                            ? Image.asset(
                                widget.logoImage,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.logoImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(
                        width: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // width: 150,
                              child: Text(widget.programmingLanguage,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ),
                            Difficulty(difficulty: widget.difficulty),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              cont++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.arrow_upward),
                              Text(
                                "UP",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 220,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: cont / 10,
                      ),
                    ),
                    Text("Level: $cont",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
