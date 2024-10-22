import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'ForgotPassword.dart';
import 'Register_page.dart';
import 'Homepage.dart'; // Correct import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp()); // Moved outside the initialization
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _keepMeSignedIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize FirebaseAuth
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()), // Navigate to Homepage on successful login
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showErrorDialog('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showErrorDialog('Wrong password provided for that user.');
      } else {
        _showErrorDialog(e.message ?? 'An unknown error occurred.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to the app',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 40),

                // Email Address Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'email@example.com',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Password Field
                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 0),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()), // Correct class name
                      );
                    },
                    child: Text('Forgot Password?'),
                  ),
                ),

                // Keep me signed in CheckboxC
                Row(
                  children: [
                    Checkbox(
                      value: _keepMeSignedIn,
                      onChanged: (value) {
                        setState(() {
                          _keepMeSignedIn = value!;
                        });
                      },
                    ),
                    Text('Keep me signed in'),
                  ],
                ),
                SizedBox(height: 5),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 10),

                // Sign in with Google
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('or sign in with'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    print('Login with Google');
                  },
                  child: Text('Continue with Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[200],
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Create an Account
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                      );
                    },
                    child: Text('Create an account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Register_page {}
