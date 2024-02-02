import 'dart:ffi';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_1/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  // GameScreen({super.key});
  String player1;
  String player2;
  GameScreen({required this.player1, required this.player2});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> _board;
  late String _currentplayer;
  late String _winner;
  late bool _gameover;

  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentplayer = "X";
    _winner = "";
    _gameover = false;
  }

  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentplayer = "X";
      _winner = "";
      _gameover = false;
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col] != "" || _gameover) {
      return;
    }

    setState(() {
      _board[row][col] = _currentplayer;
      if (_board[row][0] == _currentplayer &&
          _board[row][1] == _currentplayer &&
          _board[row][2] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][col] == _currentplayer &&
          _board[1][col] == _currentplayer &&
          _board[2][col] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][0] == _currentplayer &&
          _board[1][1] == _currentplayer &&
          _board[2][2] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][2] == _currentplayer &&
          _board[1][1] == _currentplayer &&
          _board[2][0] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      }

      _currentplayer = _currentplayer == "X" ? "O" : "X"; //switch player

      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _gameover = true;
        _winner = "Shh It's a tie";
      }

      if (_winner != "") {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            btnOkText: "Play Again",
            title: _winner == "X"
                ? widget.player1 + " Won!"
                : _winner == "O"
                    ? widget.player2 + " Won!"
                    : "Shh It's a tie",
            btnOkOnPress: () {
              _resetGame();
            })
          ..show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010048),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 530,
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: "Turn:".text.xl3.wide.color(Vx.white).bold.make(),
                    ),
                    Container(
                        child: Text(
                      _currentplayer == "X"
                          ? widget.player1 + "($_currentplayer)"
                          : widget.player2 + "($_currentplayer)",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentplayer == "X" ? Vx.red400 : Vx.green400),
                    ))
                  ],
                ),
                Container(
                  //padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Vx.purple400,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(bottom: 7, left: 7, right: 7, top: 7),
                  padding: EdgeInsets.only(bottom: 10),
                  child: GridView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      int row = index ~/ 3;
                      int col = index % 3;
                      return GestureDetector(
                        onTap: () => _makeMove(row, col),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 7),
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Vx.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              _board[row][col],
                              style: TextStyle(
                                  fontSize: 120,
                                  fontWeight: FontWeight.bold,
                                  color: _board[row][col] == "X"
                                      ? Vx.red500
                                      : Vx.green500),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _resetGame,
                child: Container(
                  decoration: BoxDecoration(
                      color: Vx.green400,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  child: "Reset Game".text.xl3.wide.bold.make(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
              widget.player1 = "";
              widget.player2 = "";
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Vx.orange400, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: "Restart Game".text.xl3.wide.bold.make(),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 40),
              child: "- Created by Harsh".text.color(Vx.gray500).make())
        ],
      )),
    );
  }
}
