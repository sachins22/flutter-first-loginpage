import 'package:flutter/material.dart';
import 'package:login_page/ballGame.dart'; // Import the main page

class Register extends StatelessWidget {
  final String email;
  final String password;

  const Register({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/register.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Column(
                children: [
                 Padding(
                  padding:const EdgeInsets.all(16.0) ,
                  child:Text('email: $email',style:const  TextStyle(color: Colors.deepOrange,fontSize: 25)),
                 ),
                 Padding(
                  padding:const EdgeInsets.all(15.0) ,
                  child:Text('password: $password',style:const  TextStyle(color: Colors.deepOrange,fontSize: 25),),
                 ),
                ],
              ),
           
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Container(
                          width: 400,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF13EC22),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Enter your username',
                            ),
                          ),
                        )),
                        Center(
                            child: Container(
                          width: 400,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Enter your email',
                            ),
                          ),
                        )),
                        Center(
                            child: Container(
                          width: 400,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Enter your Password',
                            ),
                          ),
                        )),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate back to the Login Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context)=>BallGame()));
                          },
                          child: const Text('Game'),
                        ),
                      ],
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
