import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final bool isFavorite;
  const HeartButton({super.key, required this.onTap, this.isFavorite = false});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late String heartIcon;
  late bool isClicked;

  @override
  void initState() {
    super.initState();
    isClicked = widget.isFavorite;
    heartIcon = isClicked ? IconsAssets.icClickedHeart : IconsAssets.icHeart;
  }

  @override
  void didUpdateWidget(covariant HeartButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite ||
        isClicked != widget.isFavorite) {
      setState(() {
        isClicked = widget.isFavorite;
        heartIcon = isClicked ? IconsAssets.icClickedHeart : IconsAssets.icHeart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        setState(() {
          isClicked = !isClicked;
          heartIcon =
              !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
          widget.onTap?.call();
        });
      },
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(
              
              AssetImage(heartIcon),
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
