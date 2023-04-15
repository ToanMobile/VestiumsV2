import 'package:flutter/material.dart';

import '../../res/gen/assets.gen.dart';
import 'image_widget.dart';

class ImageFullWidget extends StatelessWidget {
  final String? url;
  final Function()? onBack;
  const ImageFullWidget({required this.url, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
              onPressed: onBack,
            ),
          ),
          Expanded(
            child: NetworkCacheImage(
              width: double.infinity,
              height: double.infinity,
              url: url,
              boxFit: BoxFit.contain,
              placeholder: SizedBox(
                child: Center(
                  child: Assets.images.noImage.image(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
