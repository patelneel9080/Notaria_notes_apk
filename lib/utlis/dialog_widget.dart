import 'package:flutter/material.dart';
import 'button.dart';

class DialogWidget extends StatefulWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancelled;

  DialogWidget({
    required this.controller,
    required this.onSave,
    required this.onCancelled,
  });

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Add Task",style: TextStyle(color: Colors.white),),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 54,
            ),
            Expanded(
                child: TextField(
                  maxLines: null,
                  style: TextStyle(color: Colors.white),
                  controller: widget.controller,
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                    hintText: "Add a new task",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: size.width/8,),
          FloatingActionButton(onPressed: () {
            setState(() {
              widget.controller.clear();
            });
          },child: Icon(Icons.delete),),
          SizedBox(width: size.width/1.7,),
          FloatingActionButton(onPressed: widget.onSave,child: Icon(Icons.save),),
        ],
      ),
    );
    // return AlertDialog(
    //   backgroundColor: Colors.yellow.shade200,
    //   title: const Text("Add Task"),
    //   content: SizedBox(
    //     height: 70,
    //     child: TextField(
    //       controller: controller,
    //       cursorColor: Colors.black54,
    //       decoration: InputDecoration(
    //         hintText: "Add a new task",
    //         border: OutlineInputBorder(
    //           borderSide: BorderSide(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //           borderRadius: BorderRadius.circular(24),
    //         ),
    //         focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(24),
    //           borderSide: BorderSide(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //         enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(24),
    //           borderSide: BorderSide(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   actions: [
    //     CustomButton(
    //       lable: "Add",
    //       onPressed: onSave,
    //     ),
    //     CustomButton(
    //       lable: "Cancel",
    //       onPressed: onCancelled,
    //     ),
    //   ],
    // );
  }
}