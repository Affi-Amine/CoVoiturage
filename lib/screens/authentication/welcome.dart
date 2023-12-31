import 'package:covoiturage/screens/authentication/signIn.dart';
import 'package:covoiturage/screens/authentication/signUp.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage/constants/app_colors.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.quintenaryColor,
      resizeToAvoidBottomInset: false,
      body:Column(
        children: <Widget> [
          SizedBox(
              height: 500,
              child: Stack(
                  children:<Widget>[
                    Positioned(
                      top: -58,
                      width: width,
                      height: 550,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      width: width + 40,
                      height: 550,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/background-2.png'),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                    ),
                  ]
              )
          ),
          Column(
            children: <Widget>[
              const Text(
                'Welcome to COV',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 40,),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          showGeneralDialog(
                              barrierDismissible: true,
                              barrierLabel: "Sign In",
                              context: context,
                              pageBuilder:(context, _, __) =>Center(
                                child: Container(
                                  height: 600,
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: SignIn(  ),
                                ),
                              )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child:const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          showGeneralDialog(
                              barrierDismissible: true,
                              barrierLabel: "Sign Up",
                              context: context,
                              pageBuilder:(context, _, __) =>Center(
                                child: Container(
                                  height: 650,

                                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                  child: SignUp(  ),
                                ),
                              )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child:const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )],

      ),

    );
  }
  }

