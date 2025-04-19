import 'package:flutter/material.dart';
import 'dart:math';

class WaveGraphScreen extends StatelessWidget {
  const WaveGraphScreen({Key? key}) : super(key: key);
  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context)),
        title: const Text('Wave Graph', style: TextStyle(color: Colors.white)),
        centerTitle: true, elevation: 0,
      ),
      body: Center(child: CustomPaint(
        size: Size(MediaQuery.of(context).size.width * 0.9, 200),
        painter: WavePainter(),
      )),
    );
  }
}

class WavePainter extends CustomPainter {
  @override void paint(Canvas canvas, Size size) {
    final paint = Paint()..color=Colors.blueAccent.withOpacity(0.6)..style=PaintingStyle.fill;
    final path = Path()..moveTo(0, size.height/2);
    for(double x=0;x<=size.width;x++){
      final y=size.height/2+sin((x/size.width)*2*pi)*40;
      path.lineTo(x,y);
    }
    path..lineTo(size.width,size.height)..lineTo(0,size.height)..close();
    canvas.drawPath(path, paint);
    final linePaint=Paint()..color=Colors.white70..style=PaintingStyle.stroke..strokeWidth=2;
    final linePath=Path();
    for(double x=0;x<=size.width;x++){
      final y=size.height/2+sin((x/size.width)*2*pi)*40;
      if(x==0) linePath.moveTo(x,y); else linePath.lineTo(x,y);
    }
    canvas.drawPath(linePath, linePaint);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}
