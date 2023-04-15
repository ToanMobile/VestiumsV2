import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/res/theme/theme_service.dart';
import '../../../res/style.dart';

class DTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? onValidated; // handle error here
  final Function(String?)? onSaved;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final String? hintText;
  final Color? strokeColor;
  final Widget? prefixIcon;
  final double? prefixPadding;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? leftTitle;
  final String? rightTitle;
  final String? errorText;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? iconContraints;
  final bool autoFocus;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final bool? isHideCounterText;
  final bool? textCenter;

  DTextFromField(
      {this.controller,
      this.errorStyle,
      this.onValidated,
      this.onSaved,
      this.hintText,
      this.textStyle,
      this.strokeColor,
      this.obscureText,
      this.prefixIcon,
      this.keyboardType,
      this.suffixIcon,
      this.inputFormatters,
      this.maxLines = 1,
      this.maxLength,
      this.enabled = true,
      this.leftTitle,
      this.rightTitle,
      this.errorText,
      this.autoFocus = false,
      this.textInputAction,
      this.onFieldSubmitted,
      this.prefixPadding,
      this.isHideCounterText,
      this.textCenter,
      this.prefixConstraints = const BoxConstraints(maxHeight: 36, minHeight: 36),
      this.iconContraints = const BoxConstraints(maxWidth: 24, maxHeight: 24, minHeight: 24),
      this.contentPadding = const EdgeInsets.symmetric(vertical: 7.0, horizontal: 0.0)});

  UnderlineInputBorder _underlineInputBorder(Color? strokeColor, BuildContext context) {
    return UnderlineInputBorder(borderSide: BorderSide(color: strokeColor ?? getColor().textColorB2B2B2));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (leftTitle != null || rightTitle != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leftTitle ?? "",
                style: text13.bold.textColor777777,
              ),
              Text(
                rightTitle ?? "",
                style: text13.bold.textColor777777,
              )
            ],
          ),
        TextFormField(
          maxLength: maxLength,
          enabled: enabled,
          autofocus: autoFocus,
          obscureText: obscureText ?? false,
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: onValidated,
          onSaved: onSaved,
          textAlign: textCenter == true ? TextAlign.center : TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          style: textStyle ?? text18.textColor777777,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
              counterText: isHideCounterText == true ? "" : null,
              errorText: errorText,
              counterStyle: text12.textColor777777,
              hintText: hintText ?? "",
              hintStyle: textStyle?.copyWith(color: getColor().textColorB2B2B2) ?? text18.textColor777777,
              prefixIconConstraints: prefixConstraints,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      child: prefixIcon,
                      padding: EdgeInsets.only(left: prefixPadding != null ? prefixPadding! : 16.ws, right: prefixPadding != null ? prefixPadding! : 16.ws),
                    )
                  : null,
              suffixIconConstraints: iconContraints,
              suffixIcon: suffixIcon,
              isDense: true,
              errorStyle: errorStyle ?? text12.textErrorColor,
              contentPadding: contentPadding,
              enabledBorder: _underlineInputBorder(strokeColor, context),
              focusedBorder: _underlineInputBorder(strokeColor, context),
              border: _underlineInputBorder(strokeColor, context),
              disabledBorder: _underlineInputBorder(strokeColor, context),
              focusedErrorBorder: _underlineInputBorder(getColor().error, context),
              errorBorder: _underlineInputBorder(getColor().error, context)),
        )
      ],
    );
  }
}

class ClearTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final String? leftTitle;
  final String? rightTitle;
  final Widget? prefixIcon;
  final String? hint;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color? underlineColor;
  final int? maxLength;
  final String? Function(String?)? onValidated;
  final String? errorText;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;

  ClearTextField(
      {this.hint,
      this.inputFormatters,
      this.maxLength,
      this.controller,
      this.prefixIcon,
      this.leftTitle,
      this.rightTitle,
      this.textStyle,
      this.keyboardType,
      this.underlineColor,
      this.onValidated,
      this.errorText,
      this.contentPadding,
      this.errorStyle});

  @override
  State<StatefulWidget> createState() => _ClearTextFieldState();
}

class _ClearTextFieldState extends State<ClearTextField> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DTextFromField(
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      textStyle: widget.textStyle,
      strokeColor: widget.underlineColor ?? getColor().themeColorEBEBEC,
      controller: controller,
      hintText: widget.hint,
      maxLength: widget.maxLength,
      prefixIcon: widget.prefixIcon,
      leftTitle: widget.leftTitle,
      rightTitle: widget.rightTitle,
      onValidated: widget.onValidated,
      errorText: widget.errorText,
      errorStyle: widget.errorStyle,
      contentPadding: widget.contentPadding,
      iconContraints: const BoxConstraints(maxWidth: 30, maxHeight: 30, minHeight: 30),
      suffixIcon: controller?.text != ""
          ? MaterialButton(
              height: 24,
              minWidth: 24,
              padding: EdgeInsets.all(0),
              onPressed: () => controller?.clear(),
              child: Image.asset(
                DImages.textClear,
                width: 16.ws,
                height: 16.ws,
              ),
              shape: CircleBorder(),
            )
          : null,
    );
  }
}

class CountryCodeTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final String? leftTitle;
  final String? rightTitle;
  final Widget? prefixIcon;
  final String? hint;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color? underlineColor;
  final int? maxLength;
  final String? Function(String?)? onValidated;
  final String? errorText;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;

  CountryCodeTextField(
      {this.hint,
      this.inputFormatters,
      this.maxLength,
      this.controller,
      this.prefixIcon,
      this.leftTitle,
      this.rightTitle,
      this.textStyle,
      this.keyboardType,
      this.underlineColor,
      this.onValidated,
      this.errorText,
      this.contentPadding,
      this.errorStyle});

  @override
  State<StatefulWidget> createState() => _CountryCodeTextFieldState();
}

class _CountryCodeTextFieldState extends State<CountryCodeTextField> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DTextFromField(
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      textStyle: widget.textStyle,
      strokeColor: widget.underlineColor ?? getColor().themeColorEBEBEC,
      controller: controller,
      hintText: widget.hint,
      maxLength: widget.maxLength,
      prefixIcon: widget.prefixIcon,
      leftTitle: widget.leftTitle,
      enabled: false,
      rightTitle: widget.rightTitle,
      onValidated: widget.onValidated,
      errorText: widget.errorText,
      errorStyle: widget.errorStyle,
      contentPadding: widget.contentPadding,
      textCenter: true,
      isHideCounterText: true,
      suffixIcon: MaterialButton(
        height: 30,
        minWidth: 24,
        padding: EdgeInsets.only(right: 3),
        onPressed: () => {},
        child: Text(
          "|",
          style: text18.textColor141414,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}

class LowerCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}
