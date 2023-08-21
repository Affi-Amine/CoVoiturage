import 'package:covoiturage/constants/app_colors.dart';
import 'package:covoiturage/screens/authentication/BoxTextField.dart';
import 'package:covoiturage/screens/authentication/signIn.dart';
import 'package:covoiturage/screens/home/home_screen.dart';
import 'package:covoiturage/screens/publish/googlemap.dart';
import 'package:covoiturage/screens/publish/location_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';


class City extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.quaternaryColor,
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(50),left: Radius.circular(20))
          ),
          child: const Icon(Icons.arrow_forward),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMap()));
            //task to execute when this button is pressed
          },
        ),

      body: Stack(
          children:[ Center(

              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.my_location,
                    color: Colors.black,
                  ),
                  label:const Text('Google Map')
              ),
          ),
            ],
        ),

    );
  }
}
