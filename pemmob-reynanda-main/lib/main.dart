import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas_aplikasi/beranda/home.dart';
import 'package:tugas_aplikasi/beranda/profil.dart';
import 'package:tugas_aplikasi/beranda/search.dart';
import 'package:tugas_aplikasi/firebase_options.dart';
import 'package:tugas_aplikasi/komponen/pageMovie.dart';
import 'package:tugas_aplikasi/logres/auth_login.dart';
import 'package:tugas_aplikasi/logres/regis.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
        '/regis': (context) => const RegisterScreen(),
        '/home': (context) => const Home(),
        '/cari': (context) => const MyCari(),
        '/profil': (context) => MyProfil(),
        '/movie': (context) => const MoviePage(),
        // '/video': (context) => VideoPlayer(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  static List<Widget> _currentMenu = [MyHome(), MyCari(), MyProfil()];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentMenu.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_3_outlined,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        onTap: _changeSelectedNavBar,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
