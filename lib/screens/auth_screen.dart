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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/merah.png',
                height: 150,
              ),
              SizedBox(height: 10),
              SizedBox(height: 40),
              Text(
                'Be happy, be Semuria...',
                style: TextStyle(
                    fontSize: 18,
                    color: theme.colorScheme.onBackground,
                    fontFamily: 'playpen'),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                  foregroundColor: theme.colorScheme.onSecondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, fontFamily: 'playpen'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: theme.colorScheme.onBackground,
                        fontFamily: 'playpen'),
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
                          color: theme.colorScheme.secondary,
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          'Sign In',
          style: TextStyle(
            fontFamily: 'playpen',
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.secondary,
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
                style: TextStyle(
                  fontFamily: 'playpen',
                  color: theme.colorScheme.onBackground,
                ),
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'playpen',
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: theme.colorScheme.onBackground.withOpacity(0.6)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: theme.colorScheme.secondary, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'playpen',
                  color: theme.colorScheme.onBackground,
                ),
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Your password?',
                  labelStyle: TextStyle(
                    fontFamily: 'playpen',
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: theme.colorScheme.onBackground.withOpacity(0.6)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: theme.colorScheme.secondary, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: theme.colorScheme.onBackground.withOpacity(0.6),
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
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                  ),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                    } catch (e) {
                      setState(() {
                        _errorMessage = e.toString();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_errorMessage),
                          backgroundColor: theme.colorScheme.error,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontFamily: 'playpen'),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontFamily: 'playpen',
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontFamily: 'playpen',
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.secondary,
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
              style: TextStyle(
                fontFamily: 'playpen',
                color: theme.colorScheme.onBackground,
              ),
              decoration: InputDecoration(
                labelText: 'Type your email',
                labelStyle: TextStyle(
                  fontFamily: 'playpen',
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.colorScheme.onBackground.withOpacity(0.6)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: theme.colorScheme.secondary, width: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _passwordController,
              style: TextStyle(
                fontFamily: 'playpen',
                color: theme.colorScheme.onBackground,
              ),
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Create a password',
                labelStyle: TextStyle(
                  fontFamily: 'playpen',
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.colorScheme.onBackground.withOpacity(0.6)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: theme.colorScheme.secondary, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
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
              style: TextStyle(
                fontFamily: 'playpen',
                color: theme.colorScheme.onBackground,
              ),
              obscureText: _obscurePassword1,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                labelStyle: TextStyle(
                  fontFamily: 'playpen',
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.colorScheme.onBackground.withOpacity(0.6)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: theme.colorScheme.secondary, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword1 ? Icons.visibility_off : Icons.visibility,
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
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
                  backgroundColor: theme.colorScheme.secondary,
                  foregroundColor: theme.colorScheme.onSecondary,
                ),
                onPressed: () async {
                  if (_passwordController.text != _confirmController.text) {
                    setState(() {
                      _errorMessage = "Password tidak sama";
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _errorMessage,
                          style: const TextStyle(fontFamily: 'playpen'),
                        ),
                        backgroundColor: theme.colorScheme.error,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _errorMessage,
                          style: const TextStyle(fontFamily: 'playpen'),
                        ),
                        backgroundColor: theme.colorScheme.error,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
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
                  ),
                );
              },
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontFamily: 'playpen',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
