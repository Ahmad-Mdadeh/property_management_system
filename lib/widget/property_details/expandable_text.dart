import 'package:flutter/material.dart';
import 'package:property_management_system/resources/text_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  ExpandableText({
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14.0,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text:
              _isExpanded ? widget.text : '${widget.text.substring(0, 50)}...',
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize,
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: _isExpanded
              ? TextUtils(
                  text: 'Read Less',
                  color: ColorManager.lightPrimary,
                  fontWeight: FontWeight.normal,
                  fontSize: widget.fontSize,
                )
              : TextUtils(
                  text: 'Read More',
                  color: ColorManager.lightPrimary,
                  fontWeight: FontWeight.normal,
                  fontSize: widget.fontSize,
                ),
        ),
      ],
    );
  }
}
