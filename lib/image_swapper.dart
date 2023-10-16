import 'package:flutter/material.dart';

class ImageSwapper extends StatefulWidget {
  @override
  _ImageSwapperState createState() => _ImageSwapperState();
}
class _ImageSwapperState extends State<ImageSwapper> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
  ];
  void swapImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: swapImage,
      child: Center(
        child: Image.asset(
          imagePaths[currentImageIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

