import 'package:flutter/material.dart';
import 'package:nutricao_app/pages/home_page.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


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
              style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'OpenSans'),
              decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Digite seu e-mail',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'OpenSans'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Color.fromARGB(255, 209, 143, 100),),
            ),
            const Divider(),
            TextFormField(
              obscureText: true,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'OpenSans'),
              decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Digite sua senha',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'OpenSans'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Color.fromARGB(255, 209, 143, 100),
                  ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () => { Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),))},
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    return Color.fromRGBO(255, 209, 143, 100);
                  }),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                  ),
              child: const Text('Acessar',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'OpenSans')),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: TextButton(onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const CadastroPage()));
                }, child: 
                const Text('Cadastre-se', style: TextStyle(fontSize: 16, fontFamily: 'OpenSans' ,color: Colors.white),)
                ,)
              ),
            ),
          ],
        ))),
      ),
    );
  }
}
