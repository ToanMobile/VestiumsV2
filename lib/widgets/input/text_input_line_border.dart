import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/res/theme/theme_service.dart';
import '../../../res/style.dart';

class TextInputLineBorder extends StatefulWidget {
  final String hint;
  final TextStyle hintTextStyle;
  final TextStyle textTextStyle;
  final Function(String)? onTextChanged;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final double? radius;
  final double? width;
  final double? height;
  final int? maxLength;
  final bool? enabled;
  final int? maxLine;
  final Color? background;

  TextInputLineBorder(
      {required this.hint,
      required this.hintTextStyle,
      required this.textTextStyle,
      this.onTextChanged,
      required this.textEditingController,
      this.keyboardType = TextInputType.text,
      this.radius = 5,
      this.width = 120,
      this.height = 40,
      this.maxLength = 50,
      this.enabled = true,
      this.maxLine = 1,
      this.background});

  @override
  State<StatefulWidget> createState() => _TextInputLineBorderState();
}

class _TextInputLineBorderState extends State<TextInputLineBorder> {
  RxBool isClearText = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width!,
        height: widget.height!,
        padding: EdgeInsets.only(left: 10.ws, right: 10.ws),
        decoration: BoxDecoration(
            color: widget.background ?? getColor().themeColorWhite,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius!)),
            border: Border.all(color: getColor().themeColorD3D3D4, width: 1, style: BorderStyle.solid)),
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: widget.maxLine == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                enabled: widget.enabled!,
                controller: widget.textEditingController,
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                style: widget.textTextStyle,
                maxLines: widget.maxLine,
                decoration: InputDecoration(
                    counterText: "",
                    isDense: true,
                    filled: true,
                    hintStyle: widget.hintTextStyle,
                    hintText: widget.hint,
                    border: InputBorder.none,
                    fillColor: Colors.transparent),
                textAlign: TextAlign.start,
                onChanged: (text) {
                  if (widget.onTextChanged != null) widget.onTextChanged!(text);
                  onShowClearText(text);
                },
              ),
            ),
            if ((isClearText.value && widget.maxLine == 1 || widget.textEditingController.text.isNotEmpty) && widget.enabled!)
              InkWell(
                child: Icon(Icons.clear, size: 16.ws),
                onTap: () {
                  widget.textEditingController.text = "";
                  if (widget.onTextChanged != null) widget.onTextChanged!("");
                  onShowClearText("");
                },
              ),
            if (!widget.enabled!)
              Icon(Icons.lock, size: 16.ws),
          ],
        ));
  }

  onShowClearText(String text) {
    setState(() {
      isClearText.value = text != "" ? true : false;
    });
  }
}
