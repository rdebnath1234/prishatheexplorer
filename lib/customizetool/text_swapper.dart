// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../colorpallete/constants.dart';
class TextSwapper extends StatefulWidget {
  int currentIndex=0;
  List<String> texts=[
    "Hello Friends! I’m Prisha, and I’ve got a secret to share: the entire world is like one big family to me! Just imagine, I zoom around in my cool car, embark on delightful boat adventures, and even take to the skies in my very own airplane. How awesome is that?",
    "But you know what truly makes this journey special? It’s not just about places; it’s about the thrilling experiences, the incredible discoveries, and the joy of learning. Every twist and turn, every wave and cloud, they’re all a part of my amazing exploration.",
    "Now, here’s the best part – I want YOU and your friends to join me! Can you imagine the excitement as we dive into this captivating journey together? We’ll uncover new places, get to know fascinating things, and oh, the toys! Let’s enjoy the wonderful world of toys waiting to be discovered.",
    "My lovely friends, spark your curiosity, ignite your sense of wonder, and let’s set sail on this exhilarating adventure with me. Get ready to be amazed, get ready to explore!"
  ];
  TextSwapper({super.key});
  @override
  State<TextSwapper> createState() => _TextSwapperState();
}
class _TextSwapperState extends State<TextSwapper> {
  late String welcomeMessage;
  @override
  void initState() {
    super.initState();
    welcomeMessage = widget.texts[widget.currentIndex];
  }
  swapWelcomeMessage() {
    setState(() {
      widget.currentIndex = (widget.currentIndex + 1) % widget.texts.length;
      welcomeMessage = widget.texts[widget.currentIndex];
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: swapWelcomeMessage,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: kContainerColor,
            child: Text(welcomeMessage,
              style: const TextStyle(color: kTextWhiteColor),
            ),
          ),
    );
  }
}
