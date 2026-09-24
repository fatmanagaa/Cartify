
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onPressed;

  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          errorMessage,
          style: AppStyles.medium14White,
        ),
        onPressed != null
            ? ElevatedButton(
          onPressed: onPressed,
          child: Text(
            'Try Again',
            style: AppStyles.medium14White,
          ),
        )
            : Container(),
      ],
    );
  }
}