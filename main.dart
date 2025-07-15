
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
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),


      home: Sections(), // main widget
      );
  } // widget build blah blah
} // class my app extends stateless widget blah blah BLAH





// Homepage widget to display the main content
class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: 
              ListView(children: <Widget>[ // Start of the Unit Cards Overall thing idk
                UnitCard(
                  imageUrl: 'assets/Unit1.png',
                  title: 'Unit 1',
                  progress: '0/11',
                  description: 'Greetings and basic phrases.',
                  locked: false,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration:Duration(milliseconds: 300), content: Text('No unit 1 :(((((', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)));
                  },
                ),
                UnitCard(
                  imageUrl: 'assets/Unit1.png',
                  title: 'Unit 2',
                  progress: '0/16',
                  description: 'Talk about yourself.',
                  locked: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration:Duration(milliseconds: 300), content: Text('Did you really expect unit 2 to work???', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)));
                  },
                ),
                UnitCard(
                  imageUrl: 'assets/Unit1.png',
                  title: 'Unit 3',
                  progress: '0/20',
                  description: 'Use present tense verbs.',
                  locked: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration:Duration(milliseconds: 300), content: Text('uhh i dont know what to put here :tjmb:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)));
                  },
                ),
                
                // put the other unit cards here
              ],
            ),
            ),
           ),
          );
  }
}






// UnitCard widget to display each unit's information
class UnitCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String progress;
  final String description;
  final VoidCallback onPressed;
  final bool locked;

  const UnitCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.progress,
    required this.description,
    required this.onPressed,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage(imageUrl),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                Card(
                  color: const Color.fromRGBO(0, 129, 167, 1),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(progress),
                  ),
                ),
                
                if (locked)
                  Icon(Icons.lock,),
                  
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(description)),
                if (locked)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 129, 167, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text('Skip to $title'),
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 129, 167, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text('Start $title'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.flare),
          title: const Text('Kaigen'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.light_mode),text: "Section 1"),
              Tab(icon: Icon(Icons.lock),text: "Section 2"),
              Tab(icon: Icon(Icons.lock),text: "Section 3"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Homepage(),
            Center(child: Text("No section 2 yet")),
            Center(child: Text("No section 3 yet")),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget> [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.translate), label: 'Dictionary', tooltip: "Coming in a later version...",),
            NavigationDestination(icon: Icon(Icons.timeline), label: 'Pathway', tooltip: "Coming in a later version...",),
            ],
        ),
      ),
    );
  }
}