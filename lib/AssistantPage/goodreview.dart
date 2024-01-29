import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Images/imagess.dart';

class Goodreview extends StatefulWidget {
  @override
  _GoodreviewState createState() => _GoodreviewState();
}

class _GoodreviewState extends State<Goodreview> {
  List<String> quotes = [
    " Start a Positive Mindset: \n\nBegin your day with gratitude. Reflect on things you're thankful for. \n Set positive intentions for the day ahead.",
        "Establish a Morning Routine: \n\n Create a routine that includes activities you enjoy. \nInclude elements of self-care like exercise, meditation, or a healthy breakfast.",
        "Prioritize Tasks: \n\n Make a to-do list and prioritize tasks. Tackle the most important ones first. \nBreak down larger tasks into smaller, more manageable steps.",
        "Take Breaks:\n\nSchedule short breaks throughout the day to refresh your mind.\nUse breaks to stretch, take a walk, or engage in a quick mindfulness activity.",
        "Stay Hydrated and Eat Well:\n\n Drink plenty of water throughout the day to stay hydrated.\n Choose nutritious foods that provide sustained energy.",
        "Connect with Others:\n\nSpend time with friends, family, or colleagues.\n Share positive experiences and engage in meaningful conversations.",
        "Practice Mindfulness:\n\n Incorporate mindfulness or meditation into your day to stay present and reduce stress.\n Deep breathing exercises can help you stay centered.",
        "Limit Screen Time:\n\n Take breaks from electronic devices to reduce eye strain and promote relaxation.\n Set boundaries for social media use.",
        " Engage in Physical Activity: \n\nIncorporate exercise into your routine to boost your mood and energy levels.\n Choose activities you enjoy to make it more sustainable.",
        "Take a few minutes at the end of the day to reflect on positive moments \n Consider unplugging from work or technology before bedtime to promote better sleep.",
        " Practice Self-Compassion: \n\n Be kind to yourself, especially if things don't go as planned \n Acknowledge your efforts and achievements.",
    // Add more quotes as needed
  ];

  String currentQuote =
      "So wait I will give u some suggestion for make it more good..."; // Initial quote
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set up a timer to change the quote every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      changeQuote();
    });
  }

  void changeQuote() {
    setState(() {
      // Randomly pick a quote from the list
      currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(BackgroundImg2.icebear), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 24,
            ),
            Text(
              textAlign: TextAlign.center,
              currentQuote,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
