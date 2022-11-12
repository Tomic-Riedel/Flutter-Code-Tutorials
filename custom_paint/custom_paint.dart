/// ------------------------------------------------------------
/// --------Flutter Painting - The Complete Crash Course--------
/// --------https://medium.com/@tomicriedel/52221909e722--------
/// ------------------------------------------------------------

/// Snap 1 - Use Custom Paint in Widget Tree
import 'dart:html';

import 'package:flutter/material.dart';

Widget build(BuildContext context) {
  return CustomPaint(
    size: Size(100, 200);
    painer: TutorialPainter();
  );
}

/// Snap 2 - Create Painter Class
class TutorialPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        //...
    }

    @override
    void shouldRepaint(CustomPainer old) {
        //...
    }
}

/// Snap 3 - Paint to Canvas
@override
void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        // Specify, where circle will be
        Offset(75,75),
        // Radius of the circle 
        50, 
        Paint(),
    );

    canvas.drawLine(
        // First point of the line
        Offset.zero, 
        // Second point of the line
        Offset(29, 20), 
        Paint(),
    );

    canvas.drawRect(
        // Use Rect.fromPoints and specify two
        // points that will be connected in a
        // Rectangle
        Rect.fromPoints(
            Offset(zero), 
            Offset(50, 50),
        ),
        Paint(),
    );  
}

/// Snap 4 - Use shouldRepaint

// Our canvas will never repaint, so we can just
// set it to false
@override
void shouldRepaint(CustomPainer old) => false;