import 'package:flutter/material.dart';
import 'package:covoiturage/constants/app_colors.dart';

class Signin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();


    return Scaffold(
      //backgroundColor: AppColors.wheat,
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1),
              Color.fromRGBO(58, 36, 73, 1),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientRotation(130 * 3.1415927 / 180),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
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
                SizedBox(height: 40,),
      
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor)
                      ),
                      fillColor: Colors.white70,
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                      hintMaxLines: 2,
      
                    ),
                    obscureText: false,
                  ),
                ),
      
                SizedBox(height: 10),
      
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor)
                      ),
                      fillColor: Colors.white70,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                      hintMaxLines: 2,
      
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
