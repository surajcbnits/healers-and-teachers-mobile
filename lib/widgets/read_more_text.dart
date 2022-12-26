import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../helper/text_style.dart';

class ReadMoreText extends StatefulWidget {
  const ReadMoreText({super.key, required this.text});
  final String text;

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
                  text: widget.text
                      .substring(0, textLength > 150 ? 150 : textLength),
                  style: TextStyleHelper.t14b400()
                      .copyWith(color: AppColor.grey, height: 1.3),
                ),
          if (!isReadMore)
            TextSpan(
              text: "...",
              style: TextStyleHelper.t14b400()
                  .copyWith(color: AppColor.grey, height: 1.3),
            ),
          if (textLength > 150)
            TextSpan(
              text: isReadMore ? "Read Less" : "Read More",
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