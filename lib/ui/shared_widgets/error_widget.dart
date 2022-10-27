import 'package:flutter/material.dart';

import '../../api/models/api_response.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import 'rounded_button.dart';

class ErrorWidget extends StatelessWidget {
  ErrorWidget({
    Key? key,
    this.onTryAgain,
    this.showImage = false,
    this.error,
    this.errorMessage,
    this.retryLabel,
    this.textAlign,
  }) : super(key: key);

  final VoidCallback? onTryAgain;
  final ApiResponse? error;
  final TextAlign? textAlign;
  final String? errorMessage;
  final String? retryLabel;
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showImage)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 24.0,
                ),
                child: Image.asset(
                  'assets/images/pika_detective.png',
                  width: 200,
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoIcon(context),
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 2,
                          right: 32,
                        ),
                        child: Text(
                          errorMessage ?? 'Oops that\'s an error...',
                          style: PokeAppText.body2Style,
                          textAlign: textAlign ?? TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (onTryAgain != null)
              RoundedButton(
                label: retryLabel ?? 'Try Again',
                isFilled: false,
                disableShadow: true,
                onPressed: onTryAgain,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoIcon(
    BuildContext context,
  ) {
    return Icon(
      Icons.info_outline,
      color: colors(context).textOnForeground,
      size: 18,
    );
  }

}
