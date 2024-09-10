import 'package:flutter/material.dart';
import 'package:login_page/register.dart'; // Import the Register Page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controllers to capture input from text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  void _navgationMange() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields';
      });
    } else {
      setState(() {
        errorMessage = '';
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Register(
  email: emailController.text,
  password: passwordController.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/login.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 16.0, top: 40.0),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  labelText: 'Enter your Email',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 16.0, top: 20.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  labelText: 'Enter your Password',
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed:_navgationMange,
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
