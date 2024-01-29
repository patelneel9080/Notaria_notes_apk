import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/utlis/dialog_widget.dart';
import 'package:todo_app/utlis/todo_list_tile.dart';

import '../AssistantPage/assistantpage.dart';
import '../Images/imagess.dart';
import '../app_const.dart';
import '../dailyquotes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.pvtupdateDatabase();
  }

  final controller = TextEditingController();

  void createAddTask() {
    showDialog(
      context: (context),
      builder: (context) {
        return DialogWidget(
          controller: controller,
          onSave: saveTask,
          onCancelled: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveTask() {
    setState(
      () {
        if (controller.text.isEmpty) {
          // Navigator.of(context).pop();
        } else {
          db.todoList.add([controller.text, false]);
          controller.clear();
        }
      },
    );
    db.pvtupdateDatabase();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(
      () {
        db.todoList.removeAt(index);
      },
    );
    db.pvtupdateDatabase();
  }

  @override
  void initState() {
    if (box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //700
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          "NOTARIA",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => DailyQuotes(),
          //           ));
          //     },
          //     icon: const Icon(CupertinoIcons.smiley))
          GestureDetector(
            onTap: () {},
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DailyQuotes(),
                      ));
                },
                icon: const Icon(
                  CupertinoIcons.quote_bubble_fill,
                  color: Colors.amber,
                )),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    " Hi $UserId,",
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Image.network(WelcomeBkg.bitemoji)
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text(
                "Assistant",
                style: TextStyle(
                    color: Color(0xff898989), fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssistantPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.quote_bubble_fill),
              title: Text(
                "Daily Quotes",
                style: TextStyle(
                    color: Color(0xff898989), fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DailyQuotes(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("App Info",style: TextStyle(color: Color(0xff898989), fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 44,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssistantPage(),
                    ));
              },
              child: Container(
                height: size.height / 8,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(BackgroundImg2.three),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Assistants",
                          style: GoogleFonts.aboreto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 54,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width / 17,
                ),
                const Text(
                  "Your Notes :",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: db.todoList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                  taskName: db.todoList[index][0],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) {
                    deleteTask(index);
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createAddTask,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
