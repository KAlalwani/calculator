import 'package:flutter/material.dart';

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
  int? y;

  int _add(int x, int y){return 0;}
  int _sub(int x, int y){return 0;}
  int _mult(int x, int y){return 0;}
  int _div(int x, int y){return 0;}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.blue[100],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue[200],
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
                            if (x == null){
                              x =7;
                            } else {
                              y = 7;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('7', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[8]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            if (x == null){
                              x =8;
                            } else {
                              y = 8;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child:Text('8', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[9]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             if (x == null){
                              x =9;
                            } else {
                              y = 9;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('9', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //DEL
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
                        ),
                        //AC
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
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
                             if (x == null){
                              x =4;
                            } else {
                              y = 4;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('4', style: TextStyle(color: Colors.blue[900]),)) , 
                        ),
                        //[5]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             if (x == null){
                              x =5;
                            } else {
                              y = 5;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('5', style: TextStyle(color: Colors.blue[900]),)) , 
                        ),
                        //[6]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             if (x == null){
                              x =6;
                            } else {
                              y = 6;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('6', style: TextStyle(color: Colors.blue[900]),)) , 
                        ),
                        //mult
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
                        ),
                        //div
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
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
                             if (x == null){
                              x =1;
                            } else {
                              y = 1;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('1', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[2]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             if (x == null){
                              x =2;
                            } else {
                              y = 2;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('2', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //[3]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             if (x == null){
                              x =3;
                            } else {
                              y = 3;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('3', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //add
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
                        ),
                        //sub
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
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
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
                        ),
                        //[0]
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                             if (x == null){
                              x =0;
                            } else {
                              y = 0;
                            }
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Text('0', style: TextStyle(color: Colors.blue[900]),)) ,
                        ),
                        //.
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
                        ),
                        //percent
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
                        ),
                        // = 
                        Expanded(
                          child:OutlinedButton(onPressed: (){
                            final result = _add(0, 0);
                          }, style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[300],
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero)
                          ),
                          child: Icon(Icons.add, color: Colors.blue[900],)) ,
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
