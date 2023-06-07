import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_test/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class  MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController  userNameEditing = TextEditingController();
  TextEditingController  phoneNumberEditing = TextEditingController();

  String user_name= '';
  late int  user_phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin()async{

    SharedPreferences sp =await  SharedPreferences.getInstance();
    user_name=sp.getString('user_name')??'';
    user_phone=sp.getInt('user_phone')?? 0;


  }


  @override
 Widget build(BuildContext context) {
    String name;
    String phoneNumber;


    return Scaffold(
      appBar: (AppBar
        (title: Text('Shared Preferences'),
        centerTitle: true,)
      ),

      body: Center(
        child: ListView(

          children: [

            Column(
              children: [

                Text(user_name.toString()),
                //Text(user_phone.toString()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: userNameEditing,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: (BorderRadius.all(Radius.circular(25)))),
                        labelText: 'User Name',
                        hintText: 'Enter Your Name',
                        hoverColor:  Colors.white
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: phoneNumberEditing,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.numbers_sharp),
                        border: OutlineInputBorder(borderRadius: (BorderRadius.all(Radius.circular(25)))),
                        labelText: 'phone number',
                        hintText: '  017********',
                        hoverColor:  Colors.white,
                    ),
                  ),
                  SizedBox(height: 50,),
                  ElevatedButton (

                   onPressed:() async{

                     SharedPreferences sp = await SharedPreferences.getInstance();

                    sp.setString('user_name', userNameEditing.text);
                    sp.setString('user_phone', phoneNumberEditing.text);
                    print(sp.getString('user_name'));
                    print(sp.getString('user_phone'));




                   },


                   child: Text('Save to shared Preferences'))

                ],
              ),
            ),
          ],

        ),
      ),





    );
  }

  
}








//
// floatingActionButton: FloatingActionButton(
//
// onPressed: () async {
// SharedPreferences sp = await SharedPreferences.getInstance();
// sp.setString('name', 'Sk Nayeem Ur Rahman');
// sp.setInt('age', 25);
// sp.setDouble('salary', 15000.0);
// print(sp.get('name'));
// print(sp.get('salary'));
// },
// child: Icon(Icons.add),
// ),









// body: FutureBuilder(
//           future: SharedPreferences.getInstance(),
//            builder: (context,AsyncSnapshot<SharedPreferences> snapshot) {
//           return Column(
//              children: [
//                  Text(snapshot.data!.getString('name').toString()),
//                  Text(snapshot.data!.getInt('age').toString()),
//                 //Text(snapshot.data.!semanticsLabel: getDouble('salary').toString()),
//              ],
//
//           );
//
// },),