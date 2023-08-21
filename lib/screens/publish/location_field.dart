import 'package:covoiturage/screens/authentication/BoxTextField.dart';
import 'package:covoiturage/screens/authentication/signIn.dart';
import 'package:covoiturage/screens/home/home_screen.dart';
import 'package:covoiturage/screens/publish/googlemap.dart';
import 'package:flutter/material.dart';



class Location_field extends StatelessWidget {

final String title;
Location_field({super.key, required this.title});



  @override
  Widget build(BuildContext context) {

    final locationController = TextEditingController();

    return  GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoxTextField(
                  controller: locationController,
                  hintText: 'Set Location',
                  icon: Icons.place,
                  obscureText: false,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal:80.0, vertical: 15),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      title=='Pick Up'
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlaceSelectionScreen(
                                  title: 'Select Place of Departure',
                                ),
                              ),
                            )
                          : title=='Drop Off'
                            ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlaceSelectionScreen(
                                  title: 'Select Place of Departure',
                                ),
                              ),
                            );
                    },
                      icon: const Icon(
                        Icons.my_location,
                        color: Colors.purple,
                      ),
                      label: const Text('Set Location Auomatically'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Button border radius
                  ),
                        )

                  ),
                ),
                  ],
                ),
            ],
          ),
          ),
    );
  }
}
