
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculater Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? x;
  double? total;
  String num = '';
  String _equation = '';
  List digits = ['0','1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List operators = ['+', '-', '÷','×', '='];
  bool fraction = false;
  String show ="";
  int? current_operator;
  
  double? _add(){
      final double addend = double.tryParse(num) ?? 0;
      setState(() {
        total = total! + addend;
        show = total.toString();
        num = '';
      });
    return total;
  }
  double? _sub(){
      final double addend = double.tryParse(num) ?? 0;
      setState(() {
        total = total! - addend;
        show = total.toString();
        num = '';
      });
    return total;
  }
  double? _mult(){

      final double addend = double.tryParse(num) ?? 0;
      setState(() {
        total = total! * addend;
        show = total.toString();
        num = '';
      });
    return total;
  }
  double? _div(){
      final double addend = double.tryParse(num) ?? 0;
      setState(() {
        total = total! / addend;
        show = total.toString();
        num = '';
      });
    return total;
  }
  void _equals() {
    setState(() {
      // Handle the last number if one is being entered
      if (num.isNotEmpty) {
        double? lastNum = double.tryParse(num);
        if (lastNum != null) {
          if (total == null) {
            total = lastNum;
          } else if (current_operator != null) {
            // Apply the last operation
            switch (current_operator) {
              case 0: total = total! + lastNum; break;
              case 1: total = total! - lastNum; break;
              case 2: total = total! / lastNum; break;
              case 3: total = total! * lastNum; break;
            }
          }
        }
      }
      show = total?.toString() ?? '';
      num = '';
      current_operator = null;
    });
  }
  
bool number(String s) {
  bool changed = false;
  if (num.isEmpty && digits.contains(s)) {
    num = s;
    changed = true;
  }
  else if (num.isNotEmpty && digits.contains(s)) {
    if (num.length < 10) {
      num += s;
      changed = true;
    }
  }
  else if (num.isNotEmpty && s == '.' && !fraction) {
    num += '.';
    fraction = true;
    changed = true;
  }
  
  if (changed) {
    setState(() {
      // State is already updated in the variables above
      show = num;  // Update display immediately
    });
    return true;
  }
  return false;
}
  
  void _appendToEquation(String s) {
    setState(() {
      // Prevent operator at start
      // if (_equation == '' && operators.contains(s)) {
      //   return;
      // }
      // the first input must be digit
      if (_equation == '' && number(s)) {
          _equation += s;
          show = num;
          return;
      }
      

      //The input is an operator
      else if(number(s) && operators.contains(_equation[_equation.length -1])){
        _equation += s;
      }
      else if (num != '' &&operators.contains(s)) {
        show = '';
        if(s != '=')
        _equation += s;
        double? temp = double.tryParse(num);
        
        if (total == null) {
          total = temp ?? 0;
          current_operator = operators.indexOf(s);
          show = total.toString();
          num = '';
        } 
        else if(current_operator != null) {
          switch (current_operator) {
            case 0:
              _add();
              break;
            case 1:
              _sub();
              break;
            case 2:
              _div();
              break;
            case 3:
              _mult();
              break;
            case 4:
              _equals();
              break;
          }
          current_operator = operators.indexOf(s);
          if(current_operator == 4) current_operator = null;
        }
        return;
      }
      // else if(s != '=' && _equation.length >= 2 && 
      //         !operators.contains(_equation[_equation.length - 1]) && 
      //         total != null) {
      //             show = '';
      //             _equation += s;
      //             current_operator = operators.indexOf(s);}
      // ignore: curly_braces_in_flow_control_structures
      else return;
    }
    
    );
  }
  void _delFromEquation() {
    setState(() {
      // update the visible equation string
      if (num == '') {
        return;
      } else {
        _equation = _equation.substring(0, _equation.length - 1);
        num =num.substring(0, num.length -1);
      }
    });
  }
  // ignore: non_constant_identifier_names
  void _ACequation(){
    setState(() {
      _equation = '';
      num= '';
      total = null;
      show = '';
      current_operator = null;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Directionality(
                textDirection: TextDirection.ltr, // Ensures RTL behavior
                child: Stack(
                  children: [
                    Container(color: Colors.blue[100]),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_equation, style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Directionality(
                textDirection: TextDirection.ltr, // Ensures RTL behavior
                child: Stack(
                  children: [
                    Container(color: Colors.blue[200]),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(show, style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  //#1 row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //[7]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('7');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('7', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[8]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('8');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child:Text('8', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[9]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('9');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('9', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //DEL
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _delFromEquation();
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('DEL', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //AC
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _ACequation();
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('AC', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                          
                      ]
                    ),
                  ),
                  //#2 row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //[4]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('4');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('4', style: TextStyle(color: Colors.blue[900]),)) , 
                        ),
                        //[5]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('5');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('5', style: TextStyle(color: Colors.blue[900]),)) , 
                        ),
                        //[6]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('6');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('6', style: TextStyle(color: Colors.blue[900]),)) , 
                        ),
                        //mult
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('×');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(CupertinoIcons.multiply, color: Colors.blue[900],)) ,
                        ),
                        //div
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('÷');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(CupertinoIcons.divide, color: Colors.blue[900],)) ,
                        ),
                          
                      ]
                    ),
                  ),
                  //#3 row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //[1]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('1');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('1', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[2]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('2');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('2', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[3]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('3');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('3', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //add
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('+');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(CupertinoIcons.add, color: Colors.blue[900],)) ,
                        ),
                        //sub
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('-');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(CupertinoIcons.minus, color: Colors.blue[900],)) ,
                        ),
                          
                      ]
                    ),
                  ),
                  //#4 row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //sign
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('+/-', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[0]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             _appendToEquation('0');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('0', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //.
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('.');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('.', style: TextStyle(color: Colors.blue[900], fontSize: 33),)) ,
                        ),
                        //percent
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('%');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(CupertinoIcons.percent, color: Colors.blue[900],)) ,
                        ),
                        // = 
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            _appendToEquation('=');
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(CupertinoIcons.equal, color: Colors.blue[900],)) ,
                        ),
                          
                      ]
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
