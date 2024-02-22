import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';

const kClearFilterHeight = 48.0;

class ClearFilter extends StatelessWidget {
  const ClearFilter({
    Key? key,
    required this.clearFilterCallback,
    required this.isOnDarkBackground,
  }) : super(key: key);

  final VoidCallback clearFilterCallback;
  final bool isOnDarkBackground;

  @override
  Widget build(BuildContext context) {
    return _buildClearAllFiltersButton(context);
  }

  Widget _buildClearAllFiltersButton(
    BuildContext context,
  ) {
    return Container(
      height: kClearFilterHeight,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: clearFilterCallback,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Text(
              context.strings.clearFilters,
              style: PokeAppText.body3Style.copyWith(
                color: isOnDarkBackground ? context.colors.onPrimary : context.colors.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
