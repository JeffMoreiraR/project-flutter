import 'package:consolidando_aprendizado/data/program_lang_inherited.dart';
import 'package:flutter/material.dart';

class FormAddLanguage extends StatefulWidget {
  const FormAddLanguage({Key? key,required this.languagueContext}) : super(key: key);

  final BuildContext languagueContext;

  @override
  State<FormAddLanguage> createState() => _FormAddLanguageState();
}

class _FormAddLanguageState extends State<FormAddLanguage> {
  TextEditingController imageController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController nameLanguageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool textValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if(value != null && value.isNotEmpty){
      if (int.parse(value) < 1 || int.parse(value) > 5) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Linguagem"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                height: 670,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(76, 160, 245, 0.5),
                  border: Border.all(width: 2),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: (text) {
                            if (textValidator(text)) {
                              return "Informe o nome da linguagem";
                            }
                            return null;
                          },
                          controller: nameLanguageController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Nome da linguagem",
                            border: OutlineInputBorder(),
                            fillColor: Colors.white70,
                            filled: true,
                            labelText: "Nome",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (difficultyValidator(value)) {
                              return "Informe uma dificuldade entre 1 e 5";
                            }else if(value != null && value.isEmpty){
                              return "Informe uma dificuldade entre 1 e 5";
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: difficultyController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Dificuldade da linguagem",
                            border: OutlineInputBorder(),
                            fillColor: Colors.white70,
                            filled: true,
                            labelText: "Dificuldade",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          onChanged: (text) {
                            setState(() {});
                          },
                          validator: (text) {
                            if (textValidator(text)) {
                              return "Informe uma URL válida";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                          controller: imageController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "URL da Imagem",
                            border: OutlineInputBorder(),
                            fillColor: Colors.white70,
                            filled: true,
                            labelText: "URL",
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                          border: Border.all(width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.network(
                            imageController.text,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                "assets/images/nophoto.png",
                                fit: BoxFit.cover,
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("NAO ENTREI AQUI");
                              ProgramLanguagesInherited.of(widget.languagueContext).addLanguage(nameLanguageController.text
                                  , imageController.text, int.parse(difficultyController.text));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Nova linguagem adicionada!"),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Adicionar",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ])),
          ),
        ),
      ),
    );
  }
}
