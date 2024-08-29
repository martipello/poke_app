import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions/build_context_extension.dart';
import '../theme/poke_app_text.dart';
import '../utils/constants.dart';

class LaunchService {
  Future<void> launchEvent(
    BuildContext context,
    Uri uri,
  ) async {
    if (uri.scheme == Constants.kMailto) {
      await launchUrl(uri);
    } else {
      try {
        await canLaunchUrl(uri);
        launchUrl(uri);
      } catch (e) {
        launchSnackBar(context, e.toString());
      }
    }
  }

  Future<void> launchSnackBar(
    BuildContext context,
    String _url,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Failed to launch $_url',
                style: PokeAppText.body3Style.copyWith(
                  color: context.colors.onPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
