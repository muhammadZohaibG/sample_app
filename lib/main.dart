import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'profile project',
    options: DefaultFirebaseOptions.web,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My Profile',
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  // Future _initFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.web,
  //   );

  //   return firebaseApp;
  // }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void saveText(String text) async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    data.setString('name', text);
  }

  void readText() async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    String? name = data.getString('name');
    if (name != null) {
      nameController.text = name;
      _navigateToNextScreen(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readText();
  }

  @override
  Widget build(BuildContext context) {
    Future<User?> login(
        {required String mail,
        required String pass,
        required BuildContext context}) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential =
            await auth.signInWithEmailAndPassword(email: mail, password: pass);
        user = userCredential.user;
      } on FirebaseException catch (e) {
        if (e.code == "user-not-found") {
          print('User not found');
        }
      }
      return user;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: Container(
            width: 400,
            height: 410,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 210, 233),
                border: Border.all(
                  color: Colors.blue,
                  width: 5,
                )),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(30)),
                Container(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Username',
                      hintText: 'Enter Username',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  child: Text('Login'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 103, 105, 226)),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 250, 250, 250))),
                  onPressed: () async {
                    User? user = await login(
                        mail: nameController.text,
                        pass: passwordController.text,
                        context: context);
                    if (user != null) {
                      saveText(nameController.text);
                      _navigateToNextScreen(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu()));
  }
}
