import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../helper/text_style.dart';

class ReadMoreText extends StatefulWidget {
  const ReadMoreText(
      {super.key, required this.text, this.breakingLength = 150});
  final String text;
  final int breakingLength;

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    int textLength = widget.text.length;
    return RichText(
      text: TextSpan(
        children: [
          isReadMore
              ? TextSpan(
                  text: widget.text,
                  style: TextStyleHelper.t14b400()
                      .copyWith(color: AppColor.grey, height: 1.3),
                )
              : TextSpan(
                  text: widget.text.substring(
                      0,
                      textLength > widget.breakingLength
                          ? widget.breakingLength
                          : textLength),
                  style: TextStyleHelper.t14b400()
                      .copyWith(color: AppColor.grey, height: 1.3),
                ),
          if (!isReadMore && textLength > widget.breakingLength)
            TextSpan(
              text: "...",
              style: TextStyleHelper.t14b400()
                  .copyWith(color: AppColor.grey, height: 1.3),
            ),
          if (textLength > widget.breakingLength)
            TextSpan(
              text: isReadMore ? " Read Less" : " Read More",
              style: TextStyleHelper.t14b600()
                  .copyWith(color: AppColor.primaryColor, height: 1.3),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isReadMore = !isReadMore;
                  });
                },
            ),
        ],
      ),
    );
  }
}
