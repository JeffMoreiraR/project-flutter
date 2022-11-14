import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  final String programmingLanguage;
  final String logoImage;

  const InitialScreen(this.programmingLanguage, this.logoImage, {Key? key})
      : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(children: [
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
                            child: Image.asset(
                              widget.logoImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(widget.programmingLanguage,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  cont++;
                                });
                              },
                              child: const Icon(Icons.add))
                        ]),
                  )),
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
        ]));
  }
}
