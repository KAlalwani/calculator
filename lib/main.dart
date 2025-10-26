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
  int? total;
  String num = '';
  String _equation = '';
  List digits = ['0','1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List operators = ['+', '-', '÷','×'];

  
  int? _add(int x){
    if(total == null)
      total = x;
    else
      total = total! + x;
    return total;
  }
  int _sub(int x){return 0;}
  int _mult(int x){return 0;}
  int _div(int x,){return 0;}

  void _appendToEquation(String s) {
    setState(() {
      // update the visible equation string
      if (_equation == '') {
        for(var i in digits){
          if(s == i) {
            _equation = s;
            num = s;
          }}
          return;
      } else {
          if(num.length < 10) {
            _equation = _equation + s;
            for(var i in operators){
              if(s == i) {
                num = '';
              }
            }
            for(var i in digits){
              if(s == i) {
                num = num + s;
              }
            }
          }
          else {return;}
      }
    });
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
  void _ACequation(){
    setState(() {
      _equation = '';
      num= '';
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
                      child: Text(num, style: TextStyle(color: Colors.black),),
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
                            _add(int.parse(num));
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
