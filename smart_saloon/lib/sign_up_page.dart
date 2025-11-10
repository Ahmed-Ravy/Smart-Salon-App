import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_saloon/sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.deepOrangeAccent, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            //ignoring the notch and bottom bar
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(16),
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
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
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), //making a space between both text

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ClipRRect(
                      //used to blur a particular place...without this, backdrop filter will blur the whole screen.
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 15,
                          sigmaY: 15,
                        ), //blurring part
                        child: Container(
                          //works as card here
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white24,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              //editing Log in text
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ), //keeping a constant space between the text and text field
                              //Email  textfield part
                              TextField(
                                //user name text field
                                cursorColor: Colors.deepPurple,
                                decoration: InputDecoration(
                                  //decoration time
                                  hintText:
                                      "Email", //the text which will be shown inside the text field as default
                                  hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                      color: const Color(0xFF6A1B9A),
                                      width: 1.5,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_4_sharp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ), //keeping a constant space between the text and text field
                              //password textfield part
                              TextField(
                                cursorColor: Colors.deepPurple,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // re-write password textfield part
                              TextField(
                                cursorColor: Colors.deepPurple,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Re-Write Password",
                                  hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              //Log in Button part
                              SizedBox(
                                width: 165,
                                child: FilledButton.icon(
                                  onPressed: () {},
                                  style: FilledButton.styleFrom(
                                    backgroundColor: const Color(0xFF6A1B9A),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.login_sharp,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  iconAlignment: IconAlignment.end,
                                  label: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white70, // Adjust color to match your theme
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // The "Sign in" button (using TextButton for a cleaner look)
                  FilledButton(
                    onPressed: () {
                      // Navigate to the Sign Up screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF6A1B9A),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white, // Contrast color for the link
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // Optional: Add an underline if desired
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
