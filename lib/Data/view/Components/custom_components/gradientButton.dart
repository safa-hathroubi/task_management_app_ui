import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

class GradientButton extends StatelessWidget {
  final String gotoRoute;
  final String buttonText;
  const GradientButton({Key? key, required this.gotoRoute, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            FigmaPalette.blue,
            FigmaPalette.blue,
            FigmaPalette.blue,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(gotoRoute);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(180, 50),
          backgroundColor: Colors.blue,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),)
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}


/*
import 'package:task_management/Data/view/Components/themes/colors.dart';
import 'package:flutter/material.dart';

class gradientButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const gradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(20);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkgray.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
*/
