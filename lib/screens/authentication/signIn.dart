import 'package:flutter/material.dart';
import 'package:covoiturage/constants/app_colors.dart';

class Signin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();


    return const Scaffold(
      backgroundColor: AppColors.wheat,
      body:SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width:150,
                child: Image(
                  image: AssetImage('assets/images/welcome_back2.png'),
                )
              ),
              SizedBox(height: 20,),
              Text(
                  "It's been a while, welcome back",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.caputMortuum),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    fillColor: Colors.white70,
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                    hintMaxLines: 2,

                  ),
                  obscureText: true,
                ),
              ),

              SizedBox(height: 10),

             TextField(
               decoration: InputDecoration(
                 hintText: 'Password',
                 hintStyle: TextStyle(
                   color: Colors.grey,
                   fontStyle: FontStyle.italic,
                 ),
                 hintMaxLines: 2,

               ),
               obscureText: true,
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
