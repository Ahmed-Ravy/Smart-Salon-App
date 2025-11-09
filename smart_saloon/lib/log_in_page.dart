import 'dart:ui';

import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.indigoAccent,Colors.purpleAccent,],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          //ignoring the notch and bottom bar
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                 //keeping a padding to look good...padding at all side of "smart salon" text
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //centerlized the "Smart salon" text
                  children: [
                    Text(
                      "Smart Salon", //the text...we can say it the title.
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        //theme coppied from main.dart file. then edited
                        fontFamily:
                            'KaushanScript', //used new font here,,,not in-built
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1,), //making a space between both text

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white30,
                          width: 1.5,
                        )
                      ),
                      child: Column(
                        children: [
                          //editing Log in text
                          Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ), //keeping a constant space between the text and text field
                          //user name  textfield part
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              //user name text field
                              cursorColor: Colors.deepPurple,
                              decoration: InputDecoration(
                                //decoration time
                                hintText:
                                    "Username", //the text which will be shown inside the text field as default
                                hintStyle: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                  
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ), //the shape of the box
                                  borderSide: BorderSide(
                                    color: Colors.white60,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 1.5,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.person_4_sharp,color: Colors.white70,),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ), //keeping a constant space between the text and text field
                          //password textfield part
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.white60,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 1.5,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.lock,color: Colors.white70),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 4,),
            ],
          ),
        ),
      ),
    );
  }
}






// elevation: 13,
//                   shadowColor: Colors.black,
//                   color: Colors.white70,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusGeometry.circular(20),