import 'package:flutter/material.dart';

import '../dependency_injection_container.dart';
import '../extensions/build_context_extension.dart';
import '../theme/base_theme.dart';
import '../theme/poke_app_text.dart';
import '../ui/shared_widgets/view_models/open_pokemon_count_view_model.dart';
import 'view_models/ad_warning_view_model.dart';
import 'view_models/google_ads_view_model.dart';

class AdWarning extends StatelessWidget {
  final _openPokemonCountViewModel = getIt.get<OpenPokemonCountViewModel>();
  final _adWarningAnimationViewModel = getIt.get<AdWarningViewModel>();

  @override
  Widget build(BuildContext context) {
    return _buildAdWarning(context);
  }

  Widget _buildAdWarning(BuildContext context) {
    return StreamBuilder<int>(
      stream: _adWarningAnimationViewModel.warningPositionStream,
      builder: (context, warningPositionSnapshot) {
        final position = warningPositionSnapshot.data ?? 0;
        final turns = (warningPositionSnapshot.data ?? 0) == 0 ? 0 : 4;
        return StreamBuilder<int>(
          stream: _openPokemonCountViewModel.openPokemonCountStream,
          builder: (context, snapshot) {
            final openPokemonCount = snapshot.data ?? 0;
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: _animationDuration,
                  left: context.screenWidth - position,
                  curve: Curves.linearToEaseOut,
                  child: Container(
                    width: kAdWarningLabelMaxSize.toDouble(),
                    decoration: _adWarningBoxDecoration(),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildAnimatedPokeball(turns),
                        _mediumHorizontalMargin(),
                        _buildWarningLabel(
                          context,
                          openPokemonCount,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAnimatedPokeball(int turns) {
    return AnimatedRotation(
      curve: Curves.linearToEaseOut,
      duration: _animationDuration,
      turns: -turns.toDouble(),
      child: Image.asset(
        'assets/images/pokeball.png',
        height: 24,
        width: 24,
      ),
    );
  }

  Widget _buildWarningLabel(
    BuildContext context,
    int openPokemonCount,
  ) {
    final adInCount = kInterstitialAdFrequency - (openPokemonCount % kInterstitialAdFrequency);
    return Flexible(
      child: Text(
        'Ad in : ${adInCount == kInterstitialAdFrequency ? 0 : adInCount}',
        overflow: TextOverflow.ellipsis,
        style: PokeAppText.subtitle4Style.copyWith(
          color: colors(context).cardBackground,
        ),
      ),
    );
  }

  BoxDecoration _adWarningBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(
          360,
        ),
      ),
    );
  }

  Widget _mediumHorizontalMargin() {
    return const SizedBox(
      width: 16,
    );
  }

  Duration get _animationDuration => const Duration(
    milliseconds: 500,
  );

}
