import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:this_project/screens/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/merah.png', // Pastikan path ini benar
                height: 150,
              ),
              SizedBox(height: 10),
              SizedBox(height: 40),
              // Slogan
              Text(
                'Be happy, be Semuria...',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2b2024),
                    fontFamily: 'playpen'),
              ),
              SizedBox(height: 60),
              // Tombol Sign In
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA80038),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'playpen'),
                ),
              ),
              SizedBox(height: 20),
              // Text "Don't have an account?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: Color(0xFF2b2024), fontFamily: 'playpen'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFFA80038),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'playpen'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = ' ';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(
            fontFamily: 'playpen',
            fontWeight: FontWeight.bold,
            color: Color(0xFFA80038),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 164, 164, 164),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              TextField(
                style: const TextStyle(fontFamily: 'playpen'),
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'playpen',
                    color: Colors.grey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                style: const TextStyle(fontFamily: 'playpen'),
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Your password?',
                  labelStyle: const TextStyle(
                    fontFamily: 'playpen',
                    color: Colors.grey,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFa80038),
                      foregroundColor: Color(0xFFFBf9FA),
                    ),
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      } catch (e) {
                        setState(() {
                          _errorMessage = e.toString();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_errorMessage)));
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontFamily: 'playpen'),
                    )),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xFFa80038), fontFamily: 'playpen'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  String _errorMessage = ' ';
  bool _obscurePassword = true;
  bool _obscurePassword1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontFamily: 'playpen',
            fontWeight: FontWeight.bold,
            color: Color(0xFFA80038),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 164, 164, 164),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: _emailController,
              style: const TextStyle(fontFamily: 'playpen'),
              decoration: const InputDecoration(
                labelText: 'Type your email',
                labelStyle:
                    TextStyle(fontFamily: 'playpen', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _passwordController,
              style: const TextStyle(
                fontFamily: 'playpen',
              ),
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Create a password',
                labelStyle:
                    const TextStyle(fontFamily: 'playpen', color: Colors.grey),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _confirmController,
              style: const TextStyle(fontFamily: 'playpen'),
              obscureText: _obscurePassword1,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                labelStyle:
                    const TextStyle(fontFamily: 'playpen', color: Colors.grey),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword1 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword1 = !_obscurePassword1;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFa80038),
                  foregroundColor: Color(0xFFfbf9fa),
                ),
                onPressed: () async {
                  if (_passwordController.text != _confirmController.text) {
                    setState(() {
                      _errorMessage = "Password tidak sama";
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      _errorMessage,
                      style: const TextStyle(fontFamily: 'playpen'),
                    )));
                    return;
                  }
              
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ));
                  } catch (e) {
                    setState(() {
                      _errorMessage = e.toString();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      _errorMessage,
                      style: const TextStyle(fontFamily: 'playpen'),
                    )));
                  }
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontFamily: 'playpen'),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ));
                },
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(color: Color(0xFFa80038), fontFamily: 'playpen'),
                )),
          ],
        ),
      ),
    );
  }
}
