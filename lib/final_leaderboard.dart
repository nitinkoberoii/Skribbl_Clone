import 'package:flutter/material.dart';

class FinalLeaderBoard extends StatelessWidget {
  final scoreBoard;
  final String winner;

  FinalLeaderBoard(
    this.scoreBoard,
    this.winner,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: double.maxFinite,
        child: Column(
          children: [
            ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: scoreBoard.length,
              itemBuilder: (context, index) {
                var data = scoreBoard[index].values;
                return ListTile(
                  title: Text(data.elementAt(0),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 23)),
                  trailing: Text(data.elementAt(1),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$winner has won the game!",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
