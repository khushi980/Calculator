import 'package:flutter/material.dart';
import 'dart:core';

class calc extends StatefulWidget {
  const calc({Key? key}) : super(key: key);

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
String out="0";
String temp ="0";
double num1 =0.0;
double num2 =0.0;
String opr=" ";

buttonpressed(String buttontext){
  print(buttontext);
  if(buttontext == "Clear")
    {
       out="0";
       temp ="0";
       num1 =0.0;
       num2 =0.0;
       opr=" ";
    }
  else if(buttontext =="*" || buttontext =="+" || buttontext =="-" || buttontext =="/"){
    num1 = double.parse(out);
   opr =buttontext;
    temp ="0";
  }
  else if(buttontext =="="){
    num2= double.parse(out);
    if(opr == "+"){
      temp =(num1 + num2).toStringAsFixed(3);
    }
    if(opr == "-"){
      temp =(num1 - num2).toStringAsFixed(3);
    }
    if(opr == "*"){
      temp =(num1 * num2).toStringAsFixed(3);
    }
    if(opr == "/"){
      temp =(num1 / num2).toStringAsFixed(3);
    }
    num1 =0.0;
    num2 =0.0;
    opr = "";
  }
  else{
    temp += buttontext;
  }
  setState((){
    out = double.parse(temp).toStringAsFixed(3);
  }
  ) ;
}

  Widget button(String buttontext){
    return Expanded(child: OutlinedButton(
      onPressed: ()=> buttonpressed(buttontext),
      child: Text(buttontext ),
    )
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(12),
                child: Text(out, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              )
          ),
          Expanded(child: Divider()),
          Column(
            children: [


              Row(children: [button("1"),button("2"),button("3")]),
              Row(children: [button("4"),button("5"),button("6")]),
              Row(children: [button("7"),button("8"),button("9")]),
              Row(children: [button("="),button("0"),button("Clear")]),
             Row(children: [button("*"),button("/"),button("+"), button("-")]),
            ],
          ),

          // widget(child: )
        ],
      ),

    );
  }
}

