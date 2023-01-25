import 'package:flutter/material.dart';
import 'dart:math';

//Dart;Math je biblioteka za matematicke operacije

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//Statefull widget je za promenu stanja aplikacije
//interakcija sa korisnikom, dok je stateless za staticne stvari

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //int je definisan datatype jer je dart
  //staticki jezik za razliku od JS koji je dinamcicki

  int LeftDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    //Centriran je Row koji sadrzi Expaneded widget
    //koji neodzvoljava da se dogodi overflow,
    //nesto slicno kao SafeArea

    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              // TextButton je zamena za stari FlatButton
              onPressed: () {
                setState(
                  () {
                    //SetState je za promenu state, koju trigiruje
                    //onPress

                    LeftDiceNumber = Random().nextInt(6) + 1;
                    // broj od 0 do max-1
                    //medjutim kad dodamo +1 ne moze da izbaci 0 i
                    //broj max - 1 ostaje max sto je 6
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('images/dice$LeftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  print('Right button is pressed');
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('images/dice1.png'),
                )),
          ),
        ],
      ),
    );
  }
}
