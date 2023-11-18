import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unihack/signup.dart';




void main()  {
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  Future<FirebaseApp> _initializeFireBase() async
  {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFireBase(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return const SignUpPage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
