import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pc,
      children: [],
    ));
  }
}
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Image.asset('assets/Banner.png', fit: BoxFit.fitWidth),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         currentIndex: 0,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, size: 30),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search, size: 30),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add, size: 30),
//             label: '',
//           ),
//            BottomNavigationBarItem(
//             icon: Icon(Icons.person_2, size: 30),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
