import 'package:flutter/material.dart';
import 'dart:io';

class ConfirmScreen extends StatelessWidget {
  final String imagePath;

  const ConfirmScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              File(imagePath), // Hiển thị ảnh đã chụp
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight / 5,
            color: Colors.grey,
            child: Stack(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: button(Icons.close, Alignment.bottomLeft, (screenHeight / 5) * 1 / 2, screenHeight / 20, screenWidth / 10, Colors.red),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context, imagePath);
                        },
                        child: button(Icons.check, Alignment.bottomRight, (screenHeight / 5) * 1 / 2, screenHeight / 20, screenWidth / 10, Colors.green),
                      ),
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(IconData icon, Alignment alignment, double size, double margin1, double margin2, Color background) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(
          left: margin2,
          bottom: margin1,
          top: margin1,
          right: margin2,
        ),
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: (size * 2) / 3,
          ),
        ),
      ),
    );
  }
}