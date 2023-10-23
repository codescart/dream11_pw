import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool? loading;
  final Function() onTap;
  final String text;
  final Color? btnColor;
  final Color? textColor;
  final BoxBorder? border;

  const CustomButton({
    super.key,
    this.loading,
    required this.onTap,
    required this.text,
    this.btnColor = Colors.red,
    this.textColor = Colors.white,
    this.border,
  });



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        onTap();
      },
      child: Ink(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: width * 0.8,
            height: height * 0.05,
            decoration: BoxDecoration(
              color: btnColor,
              borderRadius: BorderRadius.circular(
                10,
              ),
              border: border,
            ),
            child: Center(
              child:  loading == true
                  ? const CircularProgressIndicator(
                color: Colors.white,
              ):Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 1.25,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
