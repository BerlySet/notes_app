import 'package:flutter/material.dart';

class NyobaClipPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Nyoba Clip Path"),
        ),
        body: Center(
          child: ClipPath(
            clipper: MyClipper(),
          child: Image(
            height: 250,
            width: 350,
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2015/11/12/18/02/away-1040726_960_720.jpg"),
          ),
        )),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  // Untuk membentuk pola klipnya
  Path getClip(Size size) {
      Path path = Path();

      path.lineTo(0, size.height);
      path.quadraticBezierTo(size.width / 2, size.height * 0.75, size.width, size.height);
      path.lineTo(size.width, 0);
      path.close();

      return path;
    }
  
    @override
    // Mengecek apakah widgetnya perlu di klip ulang atau engga
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
    // TODO: implement shouldReclip
}