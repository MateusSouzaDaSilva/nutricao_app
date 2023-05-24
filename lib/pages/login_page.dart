
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutricao_app/pages/home_page.dart';
import '../view/creditos.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 199, 144, 100),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 350,
              child: Image.asset('assets/logo.png'),
            ),
            TextFormField(

              controller: emailController,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'OpenSans'),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Digite seu e-mail',
                hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 15, fontFamily: 'OpenSans'),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                prefixIconColor: Color.fromARGB(255, 209, 143, 100),
              ),
            ),
            const Divider(),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'OpenSans'),
              decoration: const InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Digite sua senha',
                hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 15, fontFamily: 'OpenSans'),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                prefixIconColor: Color.fromARGB(255, 209, 143, 100),
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                try {
                  final userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  print(userCredential);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Conectado com sucesso!')),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Credito(),
                      ));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Usuário não encontrado!')),
                    );
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Senha incorreta')),
                    );
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) {
                  return Color.fromRGBO(255, 209, 143, 100);
                }),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
              ),
              child: const Text('Acessar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OpenSans')),

            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.all(12),
              child: Center(

                  child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CadastroPage()));
                },
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                      color: Colors.white),
                ),
              )),
            ),
          ],
        ))),
      ),
    );
  }
}
