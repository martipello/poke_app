import 'package:flutter/material.dart';

import '../../api/models/api_response.dart';
import '../../extensions/build_context_extension.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: _buildInfoIcon(context),
                ),
                const SizedBox(
                  width: 4,
                ),
                Flexible(
                  child: Text(
                    errorMessage ?? context.strings.errorMessage,
                    style: PokeAppText.body2Style.copyWith(
                      color: colors(context).textOnForeground,
                    ),
                    textAlign: textAlign ?? TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (onTryAgain != null)
              RoundedButton(
                label: retryLabel ?? context.strings.retry,
                disableShadow: true,
                fillColor: colors(context).cardBackground,
                onPressed: onTryAgain,
                textStyle: PokeAppText.body4Style.copyWith(
                  color: colors(context).cardBackground,
                ),
                outlineColor: colors(context).warning,
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
