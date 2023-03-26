import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../theme/poke_app_text.dart';
import 'view_constraint.dart';

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
      child: ViewConstraint(
        constraints: const BoxConstraints(maxWidth: kMaxScreenWidth / 2),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              emptyImage ??
                  Image.asset(
                    'assets/images/no_results_snorlax.png',
                  ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36.0,
                ),
                child: Text(
                  emptyMessage ?? context.strings.emptyMessage,
                  style: PokeAppText.body1Style,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
