
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/AssistantPage/grizzlypage.dart';


import '../Images/imagess.dart';
import 'icebear.dart';




class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppTest(),));
                    },
                    child: Container(
                      height: size.height/2.5,
                      width: size.width/2.2,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(WelcomeBkg.grizzassistant),fit: BoxFit.cover),
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height/6,),
                          Text("Grizzly",style: GoogleFonts.staatliches(color: Colors.deepOrangeAccent,fontSize: 28),)
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
                    },
                    child: Container(
                      height: size.height/2.5,
                      width: size.width/2.2,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(WelcomeBkg.icebearassistant),fit: BoxFit.cover),
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height/6,),
                          Text("IceBear",style: GoogleFonts.staatliches(color: Colors.amberAccent,fontSize: 28),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}