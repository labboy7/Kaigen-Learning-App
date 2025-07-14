import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp( MyApp());
  }

// I love men 👅

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // root widget
      theme:ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.language),
          title: const Text('Kaigen'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: 
              ListView(children: <Widget>[ // Start of the Unit Cards Overall thing idk
                Card(
                  color: Colors.black26,
                  child:
                  Padding(
                    padding: EdgeInsets.all(30),
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 20,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.hardEdge,
                          //fit: StackFit.loose,
                          children: [Image(image: NetworkImage('https://i.imgur.com/XM0ZPFH.jpeg', ),),],
                        ),
                        const Text('Unit 1',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                        const Text('Learn simple everyday phrases.',style: TextStyle(fontWeight: FontWeight.bold),),
                        ElevatedButton( 
                        onPressed: () {
                          // Action when button is pressed
                        },
                        child: const Text('Start Unit 1'),
                        ),
                    ]),
                  ),
                ),
                Divider(),
                // put the other unit cards here
              ],
            ),
            ),
           ),
          ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget> [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.translate), label: 'Dictionary'),
          NavigationDestination(icon: Icon(Icons.timeline), label: 'Pathway'),
          ],
        ),)
      );
  } // widget build blah blah
} // class my app extends stateless widget blah blah BLAH