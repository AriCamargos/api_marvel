import 'package:flutter/material.dart';

class DataText extends StatelessWidget {
  final String? text;
  final String? title;
  const DataText({super.key, this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        (text != null && text!.isEmpty)
            ? Expanded(
              child: Column(
                  children: [
                    Text(
                      '$title not found'.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
            )
            : Expanded(
              child: Column(
                  children: [
                    Text(
                      text!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
            )
      ],
    );
  }
}

class Space extends StatelessWidget {
  final double? height;
  final double? width;
  const Space({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
