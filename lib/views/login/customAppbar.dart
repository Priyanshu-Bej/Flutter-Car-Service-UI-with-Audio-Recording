import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/widgets/barcode.dart';

class AppBarCustomCurved extends StatelessWidget {
  const AppBarCustomCurved({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShadowPainter(),
      child: ClipPath(
        clipper: CurveClipper(),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 220.0, // Increased height for better spacing
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                  colors: [Color(0xFF5d65ba), Color(0xFF673b86)],
                  stops: [0.4, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // AppBar-like widget with transparent background
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    // title: const Text(
                    //   'HomePage',
                    //   style: TextStyle(color: Colors.white, fontSize: 18.0),
                    // ),
                    // leading: IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.menu, color: Colors.white),
                    // ),
                    actions: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // BigAndSmallText(
                      //   firstText: 'Good Morning',
                      //   fontSize: 40.0, // Larger font for hours
                      //   color: Colors.white,
                      //   secondText: 'hrs',
                      //   smallFontSize: 18.0, // Slightly larger small text
                      // ),
                      // SizedBox(width: 15.0),
                      BigAndSmallText(
                        firstText: 'Good Morning',

                        color: Colors.white,
                        secondText: '',

                        fontSize: 30.0, // Larger font for minutes
                        // smallFontSize: 18.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInToLinear);
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.center,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return const BarcodeScannerPage();
                              },
                            ));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.qr_code_rounded,
                            color: Colors.white,
                            size: 17.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Scan Barcode',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigAndSmallText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color color;
  final double fontSize;
  final double smallFontSize;

  const BigAndSmallText({
    super.key,
    this.firstText = '',
    this.secondText = '',
    this.color = Colors.black45,
    this.fontSize = 19.0,
    this.smallFontSize = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          firstText,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(0.0, -5.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              secondText,
              style: TextStyle(color: color, fontSize: smallFontSize),
            ),
          ),
        )
      ],
    );
  }
}

class CirclePaint extends CustomPainter {
  Paint circlePaint;

  CirclePaint() : circlePaint = Paint() {
    circlePaint
      ..style = PaintingStyle.fill
      ..strokeWidth = 10.0
      ..color = Colors.white.withAlpha(0x10);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(-175.0, -70.0), 70.0, circlePaint);
    canvas.drawCircle(const Offset(-205.0, -10.0), 80.0, circlePaint);
    canvas.drawCircle(const Offset(135.0, -80.0), 70.0, circlePaint);
    canvas.drawCircle(const Offset(145.0, 20.0), 70.0, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ShadowPainter extends CustomPainter {
  Paint shadowPaint;

  ShadowPainter() : shadowPaint = Paint() {
    shadowPaint
      ..strokeWidth = 3.0
      ..color = const Color(0x44000000)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawShadow(getCurvedPath(size),
        Colors.deepPurpleAccent.withAlpha(100), 10.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurveClipper extends CustomClipper<Path> {
  Path path;
  Offset startOffset;
  Offset endOffset;

  CurveClipper()
      : path = Path(),
        startOffset = const Offset(0, 0),
        endOffset = const Offset(0, 0);

  @override
  Path getClip(Size size) {
    return getCurvedPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  Path getCurvedPath(Size size) {
    path.lineTo(0.0, size.height - 30);
    startOffset = Offset(size.width / 4, size.height);
    endOffset = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        startOffset.dx, startOffset.dy, endOffset.dx, endOffset.dy);

    startOffset = Offset(size.width - (size.width / 4), size.height);
    endOffset = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        startOffset.dx, startOffset.dy, endOffset.dx, endOffset.dy);

    path.lineTo(size.width, 0.0);
    return path;
  }
}

Path getCurvedPath(Size size) {
  Path path = Path();
  Offset startOffset;
  Offset endOffset;
  path.lineTo(0.0, size.height - 30);

  startOffset = Offset(size.width / 4, size.height);
  endOffset = Offset(size.width / 2, size.height);
  path.quadraticBezierTo(
      startOffset.dx, startOffset.dy, endOffset.dx, endOffset.dy);

  startOffset = Offset(size.width - (size.width / 4), size.height);
  endOffset = Offset(size.width, size.height - 30);
  path.quadraticBezierTo(
      startOffset.dx, startOffset.dy, endOffset.dx, endOffset.dy);

  path.lineTo(size.width, 0.0);
  return path;
}
