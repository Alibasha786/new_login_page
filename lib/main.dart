import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login_Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Perform login logic here
    String username = _usernameController.text;
    String password = _passwordController.text;

    // You can implement your authentication logic here
    // For now, let's just print the username and password
    print("Username: $username, Password: $password");

    // Simulate a successful login and navigate to the welcome page
    if (username == 'basha' && password == '123') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => WelcomePage(username: username)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(209, 6, 156, 243),
          Color.fromARGB(76, 233, 13, 233)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Center(
          child: Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 400.0),
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String username;

  WelcomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 16), // Adjust the padding
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Navigate to login page
                ); // Navigate back to the login page
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 212, 9, 219),
                  onPrimary: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/image1.jpg'), // Replace with your image asset
            fit: BoxFit.cover, // Adjust the fit to your preference
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, $username!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
