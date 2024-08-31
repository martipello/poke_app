import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import 'view_constraint.dart';

extension PokeDialogShow on PokeDialog {
  Future<bool?> show(
    BuildContext context, {
    bool isDismissible = true,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return this;
      },
    );
  }
}

class PokeDialog extends StatelessWidget {
  const PokeDialog({
    this.title,
    required this.content,
    this.dialogActions,
    this.dialogButtonBar,
    this.isDismissible = true,
  }) : assert(dialogActions != null || dialogButtonBar != null);

  final String? title;
  final Widget content;
  final List<DialogAction>? dialogActions;
  final Widget? dialogButtonBar;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return ViewConstraint(
      child: WillPopScope(
        onWillPop: () async => isDismissible,
        child: Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              _buildBackgroundPokeball(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildContent(),
                  const SizedBox(
                    height: 24,
                  ),
                  if (dialogButtonBar != null)
                    dialogButtonBar!
                  else
                    _buildPickerButtons(
                      context,
                      _getActions(context),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: content,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    title!,
                    style: PokeAppText.subtitle1Style,
                  ),
                )
              : const SizedBox(),
          if (isDismissible)
            _buildCloseButton(
              context,
            )
        ],
      ),
    );
  }

  Widget _buildBackgroundPokeball() {
    return Positioned(
      bottom: -16,
      left: -15,
      child: Transform.rotate(
        angle: 0.75,
        child: Image.asset(
          'assets/images/pokeball_outline.png',
          height: 80,
          width: 80,
        ),
      ),
    );
  }

  Widget _buildCloseButton(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: IconButton(
        splashRadius: 12,
        constraints: const BoxConstraints(
          minWidth: 12,
          minHeight: 12,
        ),
        icon: Icon(
          Icons.close,
          color: context.colors.onSurface,
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }

  Widget _buildPickerButtons(
    BuildContext context,
    List<Widget> actions,
  ) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16.0,
          bottom: 8.0,
        ),
        child: Wrap(
          spacing: actions.length > 2 ? 0 : 16,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.end,
          alignment: WrapAlignment.end,
          direction: actions.length > 2 ? Axis.vertical : Axis.horizontal,
          verticalDirection: VerticalDirection.up,
          children: actions,
        ),
      ),
    );
  }

  List<Widget> _getActions(
    BuildContext context,
  ) {
    return dialogActions
            ?.map(
              (action) => _buildDialogAction(
                action,
                context,
              ),
            )
            .toList() ??
        [];
  }

  Widget _buildDialogAction(
    DialogAction action,
    BuildContext context,
  ) {
    return TextButton(
      onPressed: action.actionVoidCallback,
      child: Text(
        action.actionText,
        style: PokeAppText.body3Style,
        textAlign: TextAlign.end,
      ),
    );
  }
}

class DialogAction {
  DialogAction({
    required this.actionText,
    required this.actionVoidCallback,
  });

  final String actionText;
  final VoidCallback actionVoidCallback;
}
