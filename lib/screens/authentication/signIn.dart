import 'package:flutter/material.dart';
import 'package:covoiturage/constants/app_colors.dart';
import 'package:covoiturage/screens/authentication/BoxTextField.dart';

class Signin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();


    return Scaffold(
      backgroundColor: Colors.transparent,

      body:Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50,),
                const SizedBox(
                  height: 50,
                  child: Image(
                    image: AssetImage('assets/images/welcome_back2.png'),
                  )
                ),
                const SizedBox(height: 20,),
                const Text(
                    "It's been a while, welcome back",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 40,),

                BoxTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  icon: Icons.person,
                ),

                const SizedBox(height: 10),

                BoxTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  icon: Icons.key,
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot password ?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Create an acccount',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                  child: ElevatedButton.icon(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )
                        )

                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text("Sign In")),
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
                      'or continue with',
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
                )
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
