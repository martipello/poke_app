import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import 'map_page.dart';

class OpenLocationButton extends StatelessWidget {
  const OpenLocationButton({
    super.key,
    required this.generationName,
    this.primaryColor,
    this.secondaryColor,
  });

  final String generationName;
  final Color? primaryColor;
  final Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(6),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            context.push(
              LocationMapPage.routeName,
              extra: LocationMapPageArguments(
                generationName: generationName,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: context.additionalColors.link,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Flexible(
                  child: Text(
                    context.strings.openLocationButtonLabel,
                    style: PokeAppText.body3Style.copyWith(
                      color: context.additionalColors.link,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
