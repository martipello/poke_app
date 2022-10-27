import 'package:flutter/material.dart';

import '../../theme/poke_app_text.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    Key? key,
    this.emptyMessage,
    this.emptyImage,
  }) : super(key: key);

  final String? emptyMessage;
  final Widget? emptyImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            emptyImage ??
                Image.asset(
                  'assets/images/no_results_snorlax.png',
                  width: 200,
                ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
              ),
              child: Text(
                emptyMessage ??
                    'No Results, you can swipe down to refresh.',
                style: PokeAppText.body1Style,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
