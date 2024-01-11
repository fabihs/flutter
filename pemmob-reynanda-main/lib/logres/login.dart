import 'package:flutter/material.dart';
import 'package:tugas_aplikasi/logres/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .transparent, // Set the background color of the screen to be transparent
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/loginimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/logo.png',
                    height: 100), // Adjust the height as needed

                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                ElevatedButton(
                  onPressed: () async {
                    final message = await AuthService().login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    if (message == 'Login Success') {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message ?? 'An error occurred'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .white, // Set the button background color to white
                  ),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.black)),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                        '/regis'); // Ganti dengan nama halaman registrasi Anda
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white, // Set the text color to white
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
