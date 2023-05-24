import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:nutricao_app/view/register_view.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final _formKey = GlobalKey<FormState>();
  TextEditingController comidaController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();

  @override
  void initState() {
    comidaController = TextEditingController();
    usuarioController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    comidaController.dispose();
    usuarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      reverse: true,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
          child: Row(
            children: [
              Text('Bem vindo ao NutriApp',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ));
                    },
                    child: const Text('Cadastro'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddFood(),
                          ));
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Form(
              // key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: comidaController,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Comida"),
                        //
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: usuarioController,
                        obscureText: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nome do usuário"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          final comida = comidaController.text;
                          final usuario = usuarioController.text;

                          _firestore.collection('comidas').add({
                            'nome': comida,
                            'usuario': usuario,
                          }).then((DocumentReference doc) {
                            print('Comida salva com ID: ${doc.id}');
                          }).catchError((error) {
                            print('Erro ao salvar a comida: $error');
                          });
                        },
                        child: const Text('Salvar comida'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    ));
  }
}
