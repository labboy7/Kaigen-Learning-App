
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'lessonView.dart';
import 'lessonManager.dart';
import 'lessonListSection1.dart';

void main() async {
  
  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(body:Center(child: Text("Something went wrong here :( Please report this to @labboy7 on Discord or Github..."),));

  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNvdnd1ZnNqbXBvZGxrZ3pzZ3BwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI2NTM5OTUsImV4cCI6MjA2ODIyOTk5NX0.3VrkXuWqh2dPBHIxBTHtqeMsgL7al_aPdVeMu8mF6hw",
    url: "https://covwufsjmpodlkgzsgpp.supabase.co",
      ); // Initialize Supabase client
  runApp( MyApp());
  
  }

// I love men 👅

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // root widget
      title: 'Kaigen',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
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


      home: AuthGate(), // Auth gate, then MainFrame()
      );
  } // widget build blah blah
} // class my app extends stateless widget blah blah BLAH





// Section1 widget to display the main content
class Section1 extends StatelessWidget {
  const Section1({super.key});
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
                  imageUrl: 'assets/images/S1U1Background.png',
                  title: 'Unit 1',
                  progress: '0/10',
                  description: 'Greetings and basic phrases',
                  locked: false,
                  onPressed: () async {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonView(lessonText: 'Hello, how are you?', answerText: 'rizz', translateTo: 'Kaigen')));
                    final lessonMaster = LessonMaster();
                    //lessonMaster.lL();
                    //final lessonlogic = Lessonlogic();
                    final userProgress = await lessonMaster.getCurrentUserProgress();
    
    
                    if (userProgress != null && userProgress.section == 1 && userProgress.unit == 1 && userProgress.lesson == 1) {
                    correctAnswers = 0;
                    lessonProgress = correctAnswers/5;
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const LessonFlowS1U1L1()),);
                    }
                    if (userProgress != null && userProgress.section == 1 && userProgress.unit == 1 && userProgress.lesson == 2) {
                    correctAnswers = 0;
                    lessonProgress = correctAnswers/5;
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const LessonFlowS1U1L2()),);
                    }
                    if (userProgress != null && userProgress.section == 1 && userProgress.unit == 1 && userProgress.lesson == 3) {
                    correctAnswers = 0;
                    lessonProgress = correctAnswers/5;
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const LessonFlowS1U1L1()),);
                    }
                  
                    //lessonlogic.getS1U1;
                  },
                ),
                UnitCard(
                  imageUrl: 'assets/images/S1U2Background.png',
                  title: 'Unit 2',
                  progress: '0/10',
                  description: 'Talk about yourself',
                  locked: true,
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration:Duration(milliseconds: 300), content: Text('Did you really expect unit 2 to work???', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)));
                  },
                ),
                UnitCard(
                  imageUrl: 'assets/images/S1U3Background.png',
                  title: 'Unit 3',
                  progress: '0/10',
                  description: 'Use present tense verbs',
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




class Mainframe extends StatefulWidget {
  const Mainframe({super.key});

  @override
  State<Mainframe> createState() => _MainframeState();
}

class _MainframeState extends State<Mainframe> {
  int _selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    Widget body;
    PreferredSizeWidget? tabBar;

    if (_selectedIndex == 0) {
      // Home: show tabs
      body = const TabBarView(
        children: <Widget>[
          Section1(),
          Center(child: Text("No section 2 yet")),
          Center(child: Text("No section 3 yet")),
        ],
      );
      tabBar = const TabBar(
        labelColor: Color.fromRGBO(251, 184, 181, 1),
        //isScrollable: true,
        indicatorColor: Color.fromRGBO(251, 184, 181, 1),
        tabs: <Widget>[
          Tab(icon: Icon(Icons.light_mode), text: "Section 1"),
          Tab(icon: Icon(Icons.lock), text: "Section 2"),
          Tab(icon: Icon(Icons.lock), text: "Section 3"),
        ],
      );
    } else if (_selectedIndex == 1) {
      // Dictionary page
      body = const DictionaryPage();
      tabBar = null;
    } else if (_selectedIndex == 2) {
      // Pathway page
      body = const Center(child: Text("Pathway Page", style: TextStyle(fontSize: 24)));
      tabBar = null;
    }
    else{
      // Pathway page
      body = ProfilePage();
      tabBar = null;
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.flare),
          title: const Text('Kaigen'),
          bottom: tabBar,
        ),
        body: body,
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color.fromRGBO(251, 184, 181, 0.2),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.home, color: Color.fromRGBO(251, 184, 181, 1),), label: 'Home',),
            NavigationDestination(icon: Icon(Icons.translate, color: Color.fromRGBO(251, 184, 181, 1),), label: 'Dictionary', tooltip: "Dictionary"),
            NavigationDestination(icon: Icon(Icons.timeline, color: Color.fromRGBO(251, 184, 181, 1),), label: 'Pathway', tooltip: "Pathway"),
            NavigationDestination(icon: Icon(Icons.person, color: Color.fromRGBO(251, 184, 181, 1),), label: 'Profile', tooltip: "Profile"),
          ],
        ),
      ),
    );
  }
}

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(16.0),      
              child:ListView(children: [Card(
                      child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Kafira'),
                      subtitle: Text('Hi, Hello'),
                      isThreeLine: true,
                    ),
                ),
              ])
              );
  }
}




class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logout() async {
    final authService = AuthService();
    await authService.SignOut();
  }

  



  @override
  Widget build(BuildContext context) {
    return ListView(children:[Padding(
              padding: const EdgeInsets.all(16.0),      
              child: Center(child: ElevatedButton(
                onPressed: logout,
                child: Text('Sign Out'),
              )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(content) => Skibidi()));
                    },
                    child: Text('Debug Mode'),),
                ),
              ),



              ]);
  }
}
























// User auth stuff
class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in
  Future<AuthResponse> SignInEP(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
  // Sign up
  Future<AuthResponse> SignUpEP(String email, String password) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
    );
  }
  // Sign out
  Future<void> SignOut() async {
    await _supabase.auth.signOut();
  }
  //Get email
  String? getEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }


}



// Auth Gate (continuously listens for changes in auth state)
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (content, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body:Center(child: CircularProgressIndicator()),
            );
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return Mainframe(); // User is signed in, show main app
        } else {
          return LoginPage(); // User is not signed in, show login page
        }
      },
      );
  }
}



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.SignInEP(email, password);
    } catch (e) {
      if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.mail),border: OutlineInputBorder(), fillColor: Color.fromRGBO(251, 184, 181, 1)),),
          SizedBox(height: 16.0),
          TextField(obscureText: true, controller: _passwordController, decoration: InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock),border: OutlineInputBorder(), fillColor: Color.fromRGBO(251, 184, 181, 1)),),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: login,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(251, 184, 181, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Log In'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(251, 184, 181, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
      );
  }
}











class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {

  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final progressesDatabase = ProgressDatabase();
 


  void signup() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;


    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email and password cannot be empty'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    
    try {
      await authService.SignUpEP(email, password);
      Navigator.pop(context);
      final userId = Supabase.instance.client.auth.currentUser?.id;
      final newProgress = Progress(id: userId,section: 1, unit: 1, lesson: 1, pathway_level: 1);
              progressesDatabase.createProgress(newProgress);
    } catch (e) {
      if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup failed: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
    //lA();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        // The back button will appear automatically
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.mail),border: OutlineInputBorder(), fillColor: Color.fromRGBO(251, 184, 181, 1)),),
          SizedBox(height: 16.0),
          TextField(obscureText: true, controller: _passwordController, decoration: InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock),border: OutlineInputBorder(), fillColor: Color.fromRGBO(251, 184, 181, 1)),),
          SizedBox(height: 16.0),
          TextField(obscureText: true, controller: _confirmPasswordController, decoration: InputDecoration(labelText: "Confirm Password", prefixIcon: Icon(Icons.lock),border: OutlineInputBorder(), fillColor: Color.fromRGBO(251, 184, 181, 1)),),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: signup,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(251, 184, 181, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Sign Up'),
          ),
          
        ],
      ),
      
      );
      
  }
}





// User progresssss sashfa ahsdfasfaf ahfdashflo;asf lsfhlkasf shfh HELFPF sfklslksjfgklsjfslkfjsg

class Progress {
  String? id;
  int section;
  int unit;
  int lesson;
  int? pathway_level;


  Progress({
    this.id,
    required this.section,
    required this.unit,
    required this.lesson,
    this.pathway_level,
  });

  // map -> progress
  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      id: map['id'] as String,
      section: map['section'] as int,
      unit: map['unit'] as int,
      lesson: map['lesson'] as int,
      pathway_level: map['pathway_level'] as int,
      );
      
  }

  // progress -> map
  Map<String, dynamic> toMap(){
    return {
      //'id': id,
      'section': section,
      'unit': unit,
      'lesson': lesson,
      'pathway_level': pathway_level,
    };
  }





}





class ProgressDatabase {
  final database = Supabase.instance.client.from('progresses');
  // Create
  Future createProgress(Progress newProgress) async {
    await database.insert(newProgress.toMap());
  }
  // Read
  final stream = Supabase.instance.client.from('progresses').stream(primaryKey: ['id']).map((data) => data.map((progressMap) => Progress.fromMap(progressMap)).toList(),);
  // Update
  Future updateProgress(Progress oldProgress, int newSection, int newUnit, int newLesson, int newPathway_level) async {
    await database.update({'section' : newSection, 'unit': newUnit, 'lesson' : newLesson, 'pathway_level' : newPathway_level}).eq('id', oldProgress.id!);
  }
  // Delete
  Future deleteProgress(Progress progress) async {
    await database.delete().eq('id', progress.id!);
  }








  Future<Progress?> fetchProgressByUserId(String userId) async {
  final response = await Supabase.instance.client
      .from('progresses')
      .select()
      .eq('id', userId)
      .maybeSingle();

  if (response != null) {
    return Progress.fromMap(response);
  }
  return null;
}


}










// Testing ahhhhh



class Skibidi extends StatefulWidget {
  const Skibidi({super.key});
  

  

  


  @override
  State<Skibidi> createState() => _SkibidiState();
}

class _SkibidiState extends State<Skibidi> {

  final progressesDatabase = ProgressDatabase();
  final progressController = TextEditingController();


  void updateProgress(Progress progress) {

    progressController.text = progress.section.toString();

    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Update Progress"),
        content: TextField(controller: progressController,),
        
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              progressController.clear();
            }, 
            child: const Text("Cancel")),

            TextButton(
            onPressed: (){
              
              progressesDatabase.updateProgress(progress, 3,3,3,3);

              Navigator.pop(context);
              progressController.clear();
            }, 
            child: const Text("Save"))
        ],
      ),);


  }


  void deleteProgress(Progress progress){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Delete Progress"),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              progressController.clear();
            }, 
            child: const Text("Cancel")),

            TextButton(
            onPressed: (){
              
              progressesDatabase.deleteProgress(progress);

              Navigator.pop(context);
              progressController.clear();
            }, 
            child: const Text("Delete"))
        ],
      ),);
  }




  void addProgress() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("New Progress"),
        content: TextField(controller: progressController,),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              progressController.clear();
            }, 
            child: const Text("Cancel")),

            TextButton(
            onPressed: (){
              final newProgress = Progress(section: 1, unit: 1, lesson: 1, pathway_level: 1);
              progressesDatabase.createProgress(newProgress);

              Navigator.pop(context);
              progressController.clear();
            }, 
            child: const Text("Save"))
        ],
      ),
      
      );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progress Editor [Debug]")),
      body:StreamBuilder(
        stream: progressesDatabase.stream, 
        builder: (context, snapshot){
          //print('Snapshot: ${snapshot.data}');
          if (!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final progresses = snapshot.data!;

          return ListView.builder(
            itemCount: progresses.length,
            itemBuilder: (context, index) {
              final progress = progresses[index];
              return ListTile(
                title: Text("Section:${progress.section.toString()} Unit:${progress.unit.toString()} Lesson:${progress.lesson.toString()} Pathway Level:${progress.pathway_level.toString()}"),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          final lessonMaster = LessonMaster();
                            final userProgress = await lessonMaster.getCurrentUserProgress();
                             if (userProgress != null) {
                              lessonMaster.lF(userProgress, 1,1,1,1);
                            }
                        }, 
                        icon: Icon(Icons.undo)
                        ),
                      IconButton(
                        onPressed: () => deleteProgress(progress), 
                        icon: Icon(Icons.delete)
                        ),
                    ],
                  ),
                ),
              );
            } ,
            );
        },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProgress,
        child: const Icon(Icons.add),
        ),
    );
  }
}



