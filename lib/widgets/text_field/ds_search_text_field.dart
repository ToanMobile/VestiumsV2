import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vestiums/res/style.dart';

class DSSearchTextField extends StatefulWidget {
  final ValueChanged<String> onChange;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final double height;
  final Color? borderColor;

  const DSSearchTextField(
      {required this.onChange,
      this.textInputType,
      this.textCapitalization,
      this.hintText = '',
      this.obscureText = false,
      this.enableSuggestions = true,
      this.autocorrect = true,
      this.validator,
      this.maxLine = 1,
      this.onTap,
      this.backgroundColor,
      this.focusNode,
      this.height = 44,
      this.borderColor,
      Key? key})
      : super(key: key);

  @override
  DSDSSearchTextFieldState createState() => DSDSSearchTextFieldState();
}

class DSDSSearchTextFieldState extends State<DSSearchTextField> {
  FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  late Color _borderColor = colorB90D18;
  bool _obscureText = false;
  final BehaviorSubject<String> _behaviorSubject = BehaviorSubject<String>();

  void _onFocus() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widget.onTap?.call();
      }
      _resolveBorderColor();
    });
  }

  void _onTextChanged() {
    _controller.addListener(() {
      setState(() {
        final value = _controller.text;
        _behaviorSubject.add(value);
      });
    });
  }

  void _resolveBorderColor() {
    if (widget.borderColor != null) {
      return;
    }
    setState(() {
      if (_focusNode.hasFocus) {
        _borderColor = colorB90D18;
      } else {
        _borderColor = colorD3D3D4;
      }
    });
  }

  void _setUpDebounce() {
    _behaviorSubject.debounceTime(const Duration(milliseconds: 500)).listen((event) {
      widget.onChange.call(event);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.borderColor != null) {
      _borderColor = widget.borderColor!;
    }
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }
    _setUpDebounce();
    _onFocus();
    _onTextChanged();
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    _behaviorSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (!_focusNode.hasFocus) {
            widget.onTap?.call();
          }
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: widget.height,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 14, right: 10),
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: _borderColor),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _SearchIcon(),
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        focusNode: _focusNode,
                        keyboardType: widget.textInputType,
                        maxLines: widget.maxLine,
                        textInputAction: TextInputAction.done,
                        style: text14.textWhiteColor,
                        obscureText: _obscureText,
                        enableSuggestions: widget.enableSuggestions,
                        autocorrect: widget.autocorrect,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: color0EAC71,
                        decoration: InputDecoration(
                            isCollapsed: true, border: InputBorder.none, contentPadding: EdgeInsets.zero, hintText: widget.hintText, hintStyle: text14.textColor929394),
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (_controller.text.isNotEmpty)
                      _IconClear(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          _controller.clear();
                        },
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

class _SearchIcon extends StatelessWidget {
  const _SearchIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Center(
            child: Icon(Icons.search, size: 16.ws),
          ),
        ),
      );
}

class _IconClear extends StatelessWidget {
  final VoidCallback onTap;

  const _IconClear({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.center,
            child: Center(
              child: Icon(Icons.close, size: 16.ws),
            ),
          ),
        ),
      );
}
