import 'package:flutter/material.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoVoiturage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.wheat,
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
                  color: AppColors.caribbeanCurrent,
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
                        onPressed: () {},
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
                        onPressed: () {},
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
