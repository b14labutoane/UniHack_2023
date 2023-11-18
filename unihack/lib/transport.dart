import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unihack/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        centerTitle: true,
        title: Text(
          'My Profile',
          style:TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        leading: Icon(Icons.arrow_back),
          actions:[
            IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
            )
          ],
      ),
      body: Center(
        child:Container(
          width:300,
          height: 500,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.deepPurple[100],
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/R.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Pepsi Cola',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 85),
            _buildInfoRow(Icons.email, 'pepsicola@gmail.com'),
            _buildInfoRow(Icons.password, '123456789'),
            ElevatedButton(
              onPressed: () => {
                _signOut()
              },
              child: Text("Move to Page1"),
            ),
          ],
        ),
        ),
      ),
    );
  }
   Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 16),
          Text(text,
            style: TextStyle(
            fontSize:17,
            fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
  void _signOut() {
  FirebaseAuth.instance.signOut();
  runApp(
      new MaterialApp(
        home: new HomePage(),
      )

  );
}
}