import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutricao_app/view/login_view.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
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
                            builder: (context) => Register(),
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
                            builder: (context) => Login(),
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: emailController,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email"),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Preencha o email';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Senha"),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Preencha a senha';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: passwordConfirmController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Confirmar senha"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          final email = emailController.text;
                          final password = passwordController.text;
                          final passwordConfirm = passwordConfirmController.text;
              
                          if (password == passwordConfirm) {
                            try {
                              final userCredential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                              print(userCredential);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Usuário registrado!')),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Senha fraca')),
                                );
                              }
                              if (e.code == 'email-already-in-use') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Email já cadastrado')),
                                );
                              }
                              if (e.code == 'invalid-email') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('email invalido')),
                                );
                              } 
                            } 
              
                            // if (_formKey.currentState!.validate()) {
                            //   if (emailController.text == "luis.felipe@gmail.com" &&
                            //       passwordController.text == "123456") {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => HomePage(
                            //                 email: emailController.text,
                            //               )),
                            //     );
                            //   } else {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //       content: Text('Credenciais Inválidas')),
                            // );
                          } else {
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Senhas divergentes')),
                            );
                          }
                          //   }
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text('Preencha as informações')),
                          //   );
                          // }
                        },
                        child: const Text('Cadastrar'),
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
