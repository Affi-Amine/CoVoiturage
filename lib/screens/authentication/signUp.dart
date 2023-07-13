import 'package:flutter/material.dart';
import 'package:covoiturage/constants/app_colors.dart';
import 'package:covoiturage/screens/authentication/BoxTextField.dart';
import 'package:covoiturage/screens/authentication/circileTile.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();


    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,

      body:GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.white,

            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    BoxTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                      icon: Icons.person,
                    ),

                    const SizedBox(height: 10),

                    BoxTextField(
                      controller: emailController,
                      hintText: 'E-mail',
                      obscureText: false,
                      icon: Icons.mail,
                    ),

                    const SizedBox(height: 10),

                    BoxTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      icon: Icons.key,
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: IntlPhoneField(

                        decoration: InputDecoration(

                          labelText: 'Phone Number',
                          floatingLabelStyle: const TextStyle(
                              color: Colors.grey
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.purple)
                          ),
                        ),
                        initialCountryCode: 'TN',
                      ),
                    ),
                    const SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,left: 25,right: 25),
                      child: ElevatedButton.icon(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              minimumSize: const Size(double.infinity, 56),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  )
                              )

                          ),
                          icon: const Icon(
                              Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          label: const Text(
                              "Sign Up",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            )
                        ),
                        Text(
                          '       or continue with       ',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400],
                          ),
                        ),
                        Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            )
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleTile(
                            imagePath: "assets/images/google.png",
                          ),
                          CircleTile(
                            imagePath: "assets/images/apple.png",
                          ),
                          CircleTile(
                            imagePath: "assets/images/facebook.png",
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already a member ?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[400],
                            ),
                          ),
                          const Text(
                            '   Log in now',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ) ,
          ),
        ),
      ),
    );
  }
}
