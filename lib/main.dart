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
  void _incrementCounter() {
    setState(() {    });
  }

  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.wheat,
      body:Column(
        children: <Widget> [
          Container(
            height: 350,
            child: Stack(
                children:<Widget>[
                  Positioned(
                    top: -36,
                    width: width,
                    height: 350,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                  ),
                  Positioned(
                    width: width + 40,
                    height: 350,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background-2.png'),
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                  ),]
            )
          ),],

      ),

    );
  }
}
