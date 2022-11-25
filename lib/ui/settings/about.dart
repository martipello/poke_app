import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/clipped_app_bar.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildSliverAppBar(context),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _aboutTitle(context),
            _aboutFairUse(context),
            _aboutLicences(context),
          ],
        ),
      ),
    );
  }

  Widget _aboutTitle(BuildContext context,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.strings.about,
          style: PokeAppText.subtitle3Style,
        ),
      ],
    );
  }

  Widget _aboutFairUse(BuildContext context,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.strings.fairUse,
          style: PokeAppText.subtitle3Style,
        ),
      ],
    );
  }

  Widget _aboutLicences(BuildContext context,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.strings.licences,
          style: PokeAppText.subtitle3Style,
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: kToolbarHeight,
      backgroundColor: colors(context).cardBackground,
      titleSpacing: 0,
      title: ClippedAppBar(
        onBackTap: (){
          Navigator.of(context).pop();
        },
      ),
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
      ),
    );
  }

}
