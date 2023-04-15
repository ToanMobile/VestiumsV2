import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_system/ds_theme.dart';
import 'package:flutter_application_1/design_system/text_field/ds_search_text_field.dart';

enum DSAppbarType { banner, normal, search, plain }

class DSAppbar extends StatelessWidget {
  final DSAppbarType type;
  final String? title;
  final Function? onBack;
  final Widget? act;
  final Function(String)? onSearch;
  final String? hintText;
  final FocusNode? focusNode;
  final String leftBannerUrl;
  final String rightBannerText;

  const DSAppbar._(
      {this.type = DSAppbarType.banner,
      this.title,
      this.onBack,
      this.act,
      this.onSearch,
      this.hintText,
      this.focusNode,
      this.leftBannerUrl = '',
      this.rightBannerText = '',
      Key? key})
      : super(key: key);

  factory DSAppbar.banner(
          {required String leftBannerUrl,
          required String rightBannerText,
          Key? key}) =>
      DSAppbar._(
          type: DSAppbarType.banner,
          leftBannerUrl: leftBannerUrl,
          rightBannerText: rightBannerText,
          key: key);

  factory DSAppbar.normal(
          {String? title, Widget? act, Function? onBack, Key? key}) =>
      DSAppbar._(
          type: DSAppbarType.normal,
          title: title,
          act: act,
          onBack: onBack,
          key: key);

  factory DSAppbar.search(
          {required Function(String) onSearch,
          required FocusNode focusNode,
          Function? onBack,
          String? hintText,
          Key? key}) =>
      DSAppbar._(
          type: DSAppbarType.search,
          onSearch: onSearch,
          onBack: onBack,
          hintText: hintText,
          focusNode: focusNode,
          key: key);

  factory DSAppbar.plain({String title = '', Widget? act, Key? key}) =>
      DSAppbar._(title: title, act: act, type: DSAppbarType.plain, key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DSAppbarType.banner:
        return _BannerAppBar(
          leftBannerUrl: leftBannerUrl,
          rightBannerText: rightBannerText,
        );
      case DSAppbarType.normal:
        return _NormalAppBar(
          title: title ?? '',
          onBack: onBack,
          act: act,
        );
      case DSAppbarType.search:
        return _SearchAppBar(
          onBack: onBack,
          onSearch: onSearch!,
          hintText: hintText ?? '',
          focusNode: focusNode!,
        );
      case DSAppbarType.plain:
        return _PlainAppBar(
          title: title ?? '',
          act: act,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _BannerAppBar extends StatelessWidget {
  const _BannerAppBar(
      {required this.leftBannerUrl, required this.rightBannerText, Key? key})
      : super(key: key);
  final String leftBannerUrl;
  final String rightBannerText;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 54,
        color: DSTheme.of(context).color.backgroundColor,
        child: Row(
          children: [
            Image.asset(leftBannerUrl),
            Expanded(
                child: Text(
              rightBannerText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: DSTheme.of(context)
                  .style
                  .tsInterT16B
                  .copyWith(color: Colors.white),
            ))
          ],
        ),
      );
}

class _NormalAppBar extends StatelessWidget {
  final String title;
  final Function? onBack;
  final Widget? act;

  const _NormalAppBar(
      {required this.title, required this.onBack, this.act, Key? key})
      : super(key: key);

  void _onBackTap(BuildContext context) {
    if (onBack == null) {
      Navigator.pop(context);
      return;
    }
    onBack!();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        height: 54,
        color: DSTheme.of(context).color.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _onBackTap(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            GestureDetector(
                onTap: () {
                  _onBackTap(context);
                },
                child: Container(color: Colors.transparent, width: 8)),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _onBackTap(context);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      title,
                      style: DSTheme.of(context)
                          .style
                          .tsInterT18B
                          .copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (act != null) act!,
          ],
        ),
      );
}

class _SearchAppBar extends StatelessWidget {
  final Function? onBack;
  final Function(String) onSearch;
  final String hintText;
  final FocusNode focusNode;

  const _SearchAppBar(
      {required this.onBack,
      required this.onSearch,
      required this.hintText,
      required this.focusNode,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        height: 54,
        color: DSTheme.of(context).color.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: onBack == null
                    ? () => Navigator.pop(context)
                    : () => onBack!(),
                child: const Icon(Icons.arrow_back_ios)),
            const SizedBox(width: 8),
            Expanded(
                child: DSSearchTextField(
              hintText: hintText,
              onChange: onSearch,
              enableSuggestions: false,
              autocorrect: false,
              focusNode: focusNode,
              backgroundColor: Colors.white,
              borderColor: Colors.white,
              height: 30,
            )),
          ],
        ),
      );
}

class _PlainAppBar extends StatelessWidget {
  final String title;
  final Widget? act;

  const _PlainAppBar({required this.title, this.act, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      width: double.infinity,
      height: 54,
      color: DSTheme.of(context).color.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: DSTheme.of(context)
                    .style
                    .tsInterT20B
                    .copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (act != null) act!
        ],
      ));
}
