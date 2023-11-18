// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:unihack/custom_page_route.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
        title: Text(
          'My Profile', 
          style:TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        
          actions:[
           // IconButton(
            //onPressed: () {
              //Navigator.of(context).push(customPageRoute(HomePage()));
            //},
            //icon: Icon(Icons.arrow_back),
            //),
            IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.logout),
            ),
          ]
      ),
      body: Center(
        child:Container(
          width:300,
          height: 500,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.deepPurple[200],
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/R.jpg'),
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
            fontSize:15,
            fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}