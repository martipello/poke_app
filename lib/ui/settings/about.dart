import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokeball_scroll_thumb.dart';
import 'licences.dart';

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
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        bottom: false,
        child: FlexibleScrollbar(
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
    return ColoredBox(
      color: context.colors.surface,
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildClippedAppBar(context),
            Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: _buildScrollBody(context),
            )
          ],
        ),
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
        _buildAboutIcons(context),
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

  Widget _buildAboutIcons(BuildContext context) {
    return const SizedBox();
    // <a target="_blank" href="https://icons8.com/icon/ih6hQU67d27H/pokedex">Pokedex</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
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
        _buildLicences(context),
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
      style: PokeAppText.subtitle3Style,
    );
  }

  Widget _buildSectionBody(
    BuildContext context,
    String label,
  ) {
    return Text(
      label,
      style: PokeAppText.body3Style,
    );
  }

  Widget _buildLicences(BuildContext context) {
    final licences = Licences.licences;
    return Column(
      children: [
        ...licences.map(
          (e) => _buildLicence(
            context,
            e.item1,
            e.item2,
          ),
        ),
      ],
    );
  }

  Widget _buildLicence(
    BuildContext context,
    String label,
    String licenceText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: PokeAppText.subtitle4Style,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          licenceText,
          style: PokeAppText.captionStyle,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
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
