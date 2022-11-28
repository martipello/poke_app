import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../theme/poke_app_text.dart';

class LaunchService {
  Future<void> launchEvent(
    BuildContext context,
    String _url,
  ) async =>
      await canLaunchUrlString(_url)
          ? await launchUrlString(_url)
          : await launchSnackBar(
              context,
              _url,
            );

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
                style: PokeAppText.body3Style,
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
