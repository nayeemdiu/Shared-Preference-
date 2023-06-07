import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(title: Text('Home Page'),
       centerTitle: true,),

      body :        FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences>snapshot) {

        return Column(
                     children: [

                       Text(snapshot.data!.getString('user_name').toString()),
                       Text(snapshot.data!.getInt('user_phone').toString()),
                     ],



        );

      },)



    );
  }
}
