import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokeball_scroll_thumb.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  static const String routeName = '/about';

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
      ),
      child: Scaffold(
        body: FlexibleScrollbar(
          controller: controller,
          alwaysVisible: true,
          scrollThumbBuilder: (
            scrollInfo,
          ) {
            return PokeballScrollThumb(
              scrollbarInfo: scrollInfo,
            );
          },
          child: _buildScrollWidget(
            context,
          ),
        ),
      ),
    );
  }

  Widget _buildScrollWidget(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: context.statusBarHeight,
          ),
          _buildClippedAppBar(context),
          Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: _buildScrollBody(context),
          )
        ],
      ),
    );
  }

  Widget _buildClippedAppBar(BuildContext context) {
    return ClippedAppBar(
      onBackTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildScrollBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAboutTitle(context),
        _buildAboutFairUse(context),
        _buildAboutLicences(context),
      ],
    );
  }

  Widget _buildAboutTitle(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle(
          context,
          context.strings.about,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.thanks,
        ),
        _buildSectionDivider(),
      ],
    );
  }

  Widget _buildAboutFairUse(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle(
          context,
          context.strings.fairUse,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSectionDivider(),
      ],
    );
  }

  Widget _buildAboutLicences(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle(
          context,
          context.strings.licences,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSmallMargin(),
        _buildSectionBody(
          context,
          context.strings.fairUseDisclaimer,
        ),
        _buildSectionDivider(),
      ],
    );
  }

  Widget _buildSectionDivider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildMediumMargin(),
        PokeDivider(),
        _buildMediumMargin(),
      ],
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String label,
  ) {
    return Text(
      label,
      style: PokeAppText.subtitle3Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildSectionBody(
    BuildContext context,
    String label,
  ) {
    return Text(
      label,
      style: PokeAppText.body3Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildSmallMargin() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget _buildMediumMargin() {
    return const SizedBox(
      height: 16,
    );
  }

}
