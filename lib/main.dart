import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_calculator/Widgets/calculatorButton.dart';

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int firstNum=0, secondNum=0, decimalCount=0;
  String history = '', textToDisplay = '', currValue='', actionDisplay='', historyDisplay='', prevOperator='';

  void btnOnClick(String btnVal){
    switch(btnVal){
      case 'AC':{
        historyDisplay='';
        actionDisplay='';
        prevOperator='';
        currValue='';
        firstNum=0;
        secondNum=0;
        break;
      }
      case 'C':{
        if(historyDisplay!='' && actionDisplay!='') {
          historyDisplay+=' || ';
        }
        actionDisplay='';
        prevOperator='';
        currValue='';
        firstNum=0;
        secondNum=0;
        break;
      }
      case '⌫':{
        if(actionDisplay != ''){
          if(actionDisplay[actionDisplay.length-1]==prevOperator) {
            prevOperator='';
          }
          else {
            currValue = currValue.substring(0,currValue.length-1);
            if(currValue==''){
              currValue=firstNum.toString();
            }
          }
          actionDisplay = actionDisplay.substring(0,actionDisplay.length-1);
          historyDisplay = historyDisplay.substring(0,historyDisplay.length-1);
          // currValue = currValue.substring(0,currValue.length-1);
        }
        break;
      }
      // case '±':{
      //   if(actionDisplay!=''){
      //     firstNum*=-1;
      //     if(int.parse(currValue)>0) {
      //       currValue='-'+currValue;
      //     }
      //   }
      //   break;
      // }
      case '0':
      case '00':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':{
        currValue+=btnVal;
        actionDisplay+=btnVal;
        historyDisplay+=btnVal;
        break;
    }
      case '+':
      case '-':
      case '×':
      case '÷':{
        if(currValue!='') {
          if(firstNum==0) {
            firstNum=int.parse(currValue);
          }
          else{
            secondNum=int.parse(currValue);
            switch(prevOperator){
              case '+': currValue = (firstNum+secondNum).toString();
              break;
              case '-': currValue = (firstNum-secondNum).toString();
              break;
              case '×': currValue = (firstNum*secondNum).toString();
              break;
              case '÷': currValue = (firstNum/secondNum).toString();
              break;
            }
            firstNum=int.parse(currValue);
            secondNum=0;
            prevOperator='';
            actionDisplay=currValue;
          }
          prevOperator=btnVal;
            actionDisplay+=btnVal;
            historyDisplay+=btnVal;
          currValue='';
        }
        break;
      }
      case '=':{
        if(currValue!='' && prevOperator !=''){
          secondNum=int.parse(currValue);
          switch(prevOperator){
            case '+': currValue = (firstNum+secondNum).toString();
            break;
            case '-': currValue = (firstNum-secondNum).toString();
            break;
            case '×': currValue = (firstNum*secondNum).toString();
            break;
            case '÷': currValue = (firstNum/secondNum).toString();
            break;
          }
          firstNum=0;
          prevOperator='';
          actionDisplay=currValue;
        }
      }
      break;
    }
    setState(() {
      history=historyDisplay;
      textToDisplay=actionDisplay;

      if (kDebugMode) {
      print(firstNum);
      print(secondNum);
      print(currValue);
      // print(prevOperator);
        print(actionDisplay);
      }
    });
  }
  // void btnOnClick(String btnVal){
  //   if(btnVal == 'AC'){
  //       textToDisplay = '';
  //       firstNum = 0;
  //       secondNum = 0;
  //       res = '0';
  //       history = '';
  //     }
  //   else if(btnVal == 'C'){
  //       textToDisplay = '';
  //       firstNum = 0;
  //       secondNum = 0;
  //       res = '0';
  //     }
  //   else if(btnVal == '+' || btnVal == '-' || btnVal == '×' || btnVal == '÷'){
  //     firstNum = int.parse(textToDisplay);
  //     res = '';
  //     operation = btnVal;
  //   }
  //   else if(btnVal == '='){
  //     secondNum = int.parse(textToDisplay);
  //     if(operation == '+'){
  //       res = (firstNum + secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     if(operation == '-'){
  //       res = (firstNum - secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     if(operation == '×'){
  //       res = (firstNum * secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     if(operation == '÷'){
  //       res = (firstNum / secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //   }
  //   else{
  //     res = int.parse(textToDisplay + btnVal).toString();
  //   }
  //
  //   setState(() {
  //     textToDisplay = res;
  //   });
  //   print(textToDisplay);
  // }
  // ********************************************************************************************************
  // ********************************************************************************************************
  // ********************************************************************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Grocery-Store Calculator',
          style: TextStyle(
            color: Color(0xFF00ffff),
            fontSize: 23.0,
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Container(
        color: const Color(0xff00004d),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  history,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              alignment: const Alignment(1.0,1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  textToDisplay,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.blue,
                  ),
                ),
              ),
              alignment: const Alignment(1.0,1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                  buttonText: 'AC',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 19,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: 'C',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 25,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '⌫',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '÷',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 30,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                  buttonText: '9',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '8',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '7',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '×',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 30,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                  buttonText: '6',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '5',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '4',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '-',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 30,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                  buttonText: '3',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '2',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '1',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '+',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 30,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                  buttonText: '±',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 30,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '0',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '00',
                  buttonColor: 0x00102aad,
                  textColor: 0xFF33cc33,
                  textSize: 25,
                  callBack: btnOnClick,
                ),
                calculatorButton(
                  buttonText: '=',
                  buttonColor: 0xff000000,
                  textColor: 0xFF00ffff,
                  textSize: 30,
                  callBack: btnOnClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
