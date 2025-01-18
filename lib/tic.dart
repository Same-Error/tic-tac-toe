import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List xO = List.generate(9, (_) => "");
  bool toggle = true;
  String winner = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        1000,
        31,
        33,
        48,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          1000,
          31,
          33,
          48,
        ),
        title: const Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    if (xO[i] == "" && winner == "") {
                      setState(() {
                        xO[i] = toggle ? "X" : "O";
                        toggle = !toggle;
                        winner = checkWinner();
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        1000,
                        31,
                        33,
                        48,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: const Color.fromARGB(255, 141, 140, 140),
                          width: 3),
                    ),
                    height: 120,
                    width: 120,
                    child: Center(
                      child: Text(
                        xO[i],
                        style: TextStyle(
                          color: xO[i] == "X"
                              ? Colors.red
                              : xO[i] == "O"
                                  ? Colors.blue
                                  : Colors.white,
                          fontSize: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              winner.isEmpty ? "Game Status" : "Winner: $winner",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  String checkWinner() {
    const List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (xO[pattern[0]] == xO[pattern[1]] &&
          xO[pattern[1]] == xO[pattern[2]] &&
          xO[pattern[0]] != "") {
        return xO[pattern[0]];
      }
    }
    return "";
  }
}
