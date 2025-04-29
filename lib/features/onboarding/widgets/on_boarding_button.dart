import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ring_indicator.dart';

class OnBoardingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color fillColor;
  final Color textColor;
  final double progress;

  const OnBoardingButton({
    super.key,
    required this.onPressed,
    required this.fillColor,
    required this.textColor,
    required this.progress,
  });

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

class _OnBoardingButtonState extends State<OnBoardingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: RingIndicatorPainter(
                color: widget.fillColor,
                progress: widget.progress,
              ),
              size: const Size(100.0, 100.0),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: widget.fillColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/arrow.svg',
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
