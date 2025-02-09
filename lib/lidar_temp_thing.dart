import "dart:math";
import "dart:ui";

import "package:flutter/material.dart";

class LidarPlot extends StatefulWidget {
  const LidarPlot({super.key});

  @override
  State<LidarPlot> createState() => _LidarPlotState();
}

class _LidarPlotState extends State<LidarPlot> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: LidarViewPainter(),
    );
  }
}

class LidarViewPainter extends CustomPainter {

  LidarViewPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    canvas.translate(size.width / 2, size.height / 2);

    final axisPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    // TODO! test
    final List<double> points = [
      -1.23, 0.85, 
      1.56, -1.92, 
      -0.45, 1.67,
      0.78, -0.34,
      1.89, 1.12,  
      -1.67, -0.89,
      0.23, 1.45,
      -1.90, 0.56,
      1.34, -1.78, 
      0.67, 0.12, 
    ];

    const MAX_LIDAR_X = 2;
    const MAX_LIDAR_Y = 2;

    final List<Offset> offsets = points
    .asMap()
    .entries
    .where((entry) => entry.key.isEven && entry.key < points.length - 1)
    .map((entry) => Offset(
      // normalize to scale to cavnas
      points[entry.key] * (size.width/2) / MAX_LIDAR_X, 
      -points[entry.key + 1] * (size.height / 2) / MAX_LIDAR_Y       
    )).toList();

    canvas.drawPoints(PointMode.points, offsets, paint);

    // axes
    canvas.drawLine(
      Offset(-size.width / 2, 0),
      Offset(size.width / 2, 0), 
      axisPaint,
    );
    
    canvas.drawLine(
      Offset(0, -size.height / 2),  
      Offset(0, size.height / 2),     
      axisPaint,
    );
    // TODO!
    const ROVER_FOV_DEGS = 271;

    final noFovAngle = (360 - ROVER_FOV_DEGS) * pi / 180;
    final noVisionPaint = Paint()
      ..color = Colors.grey.withOpacity(0.6)  
      ..style = PaintingStyle.fill; 

    final radius = size.width * 1.2;
    final leftX = radius * cos(-noFovAngle/2);
    final leftY = radius * sin(-noFovAngle/2);
    final rightX = radius * cos(noFovAngle/2);
    final rightY = radius * sin(noFovAngle/2);

    final conePath = Path();
  
    conePath.moveTo(0, 0);
    conePath.lineTo(leftX, leftY);   
    conePath.lineTo(rightX, rightY);  
    conePath.close();     
  
    canvas.save();  
    canvas.rotate(pi/2); 
    canvas.drawPath(conePath, noVisionPaint);
    canvas.restore();
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}