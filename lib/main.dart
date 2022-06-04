import 'package:flutter/material.dart';
import 'dart:math';
void main(){
  return runApp(
    MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
/*BuildContext is a locator that is used to track each widget in a tree and locate
them and their position in the tree. The BuildContext of each widget is passed to
their build method. Remember that the build method returns the widget tree a widget renders.
Each BuildContext is unique to a widget.*/
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceFace(){
    setState(() {
      leftDiceNumber = Random().nextInt(6)+1;
      rightDiceNumber = Random().nextInt(6)+1;
    });
  }
  Widget build(BuildContext context){
    return Center(
      child: Row(
        children:<Widget> [
          Expanded(child: FlatButton(
            onPressed: () {
              changeDiceFace();
            },
            child: Image.asset('images/dice$leftDiceNumber.png'),
          )),
          Expanded(
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$rightDiceNumber.png')
              ,)
            ,),
        ],
      ),
    );
  }
}

