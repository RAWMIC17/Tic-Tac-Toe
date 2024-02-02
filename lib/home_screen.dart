import 'package:flutter/material.dart';
import 'package:tic_tac_toe_1/game_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController player1controller = TextEditingController();
  final TextEditingController player2controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010048),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.only(top: 200),
                  child: "Enter your name"
                      .text
                      .color(Vx.white)
                      .xl4
                      .thin
                      .fontFamily("poppins")
                      .make(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: player1controller,
                      style: TextStyle(
                        color: Vx.white,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.white)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.red500)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.white)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.red500)),
                        hintText: "Enter a fancy name like Jaggu",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter anything random....Raju maybe";
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: player2controller,
                      style: TextStyle(
                        color: Vx.white,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.white)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.red500)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.white)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Vx.red500)),
                        hintText: "Enter a fancy name like Noddy",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter anything random....Raju maybe";
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                                player1: player1controller.text,
                                player2: player2controller.text),
                          ));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                    decoration: BoxDecoration(
                      color: Vx.blue500,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                        "Begin Battle".text.color(Vx.white).xl2.bold.wide.make(),
                  ),
                ),
                 
                   Container(padding: EdgeInsets.only(top: 200),
                   //color: Vx.red300,
                    child: "- Created by Harsh".text.color(Vx.gray500).make())
                ],
            )
            ),
      ),
    );
  }
}
