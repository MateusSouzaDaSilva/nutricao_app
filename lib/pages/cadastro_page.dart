import 'package:flutter/material.dart';
import 'package:nutricao_app/pages/login_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color.fromRGBO(244, 199, 144, 100),
        body: Container(
          padding: EdgeInsets.only(top: 0, left: 40, right: 40, bottom: 0),
          child: ListView(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/Logo-Nutri.png'),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('Criar sua conta', style: TextStyle(fontSize: 28, color: Colors.white, fontFamily: 'OpenSans'),),
                ),
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Color.fromARGB(255, 209, 143, 100),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Digite seu email',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Color.fromARGB(255, 209, 143, 100),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Color.fromARGB(255, 209, 143, 100),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ))
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
            ],
          ),
        ));
  }
}

//  appBar: AppBar(
//         leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context);},
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),

// Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//             child: SingleChildScrollView(
//                 child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 300,
//               height: 300,
//               child: Image.asset('assets/logo image.png'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Center(
//                 child: Text(
//                   'Criar conta',
//                   style: TextStyle(fontSize: 26, color: Colors.white, fontFamily: 'OpenSans'),
//                 ),
//               ),
//             ),
//             TextFormField(
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//               decoration: const InputDecoration(
//                 labelText: 'Nome',
//                 labelStyle: TextStyle(color: Colors.white),
//                 hintText: 'Digite seu nome',
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//                 prefixIconColor: Color.fromARGB(255, 209, 143, 100),
//               ),
//             ),
//             const Divider(),
//             TextFormField(
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 labelStyle: TextStyle(color: Colors.white),
//                 hintText: 'Digite seu e-mail',
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//                 prefixIconColor: Color.fromARGB(255, 209, 143, 100),
//               ),
//             ),
//             const Divider(),
//             TextFormField(
//               obscureText: true,
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//               decoration: const InputDecoration(
//                 labelText: 'Senha',
//                 labelStyle: TextStyle(color: Colors.white),
//                 hintText: 'Digite sua senha',
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//                 prefixIconColor: Color.fromARGB(255, 209, 143, 100),
//               ),
//             ),
//             const Divider(),
//             ElevatedButton(
//               onPressed: () => {},
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateColor.resolveWith((states) {
//                   return Color.fromRGBO(255, 209, 143, 100);
//                 }),
//                 padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
//               ),
//               child: const Text('Cadastrar',
//                   style: TextStyle(color: Colors.white, fontSize: 16)),
//             )
//           ],
//         ))),
//       ),
