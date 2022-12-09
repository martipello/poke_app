import 'package:flutter/material.dart';

import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';

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
    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: Dialog(
        backgroundColor: colors(context).cardBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
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
                            style: PokeAppText.subtitle1Style.copyWith(
                              color: colors(context).textOnPrimary,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  if (isDismissible)
                    _buildCloseButton(
                      context,
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: content,
            ),
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
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        splashRadius: 12,
        constraints: const BoxConstraints(
          minWidth: 12,
          minHeight: 12,
        ),
        icon: Icon(
          Icons.close,
          color: colors(context).textOnForeground,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _buildPickerButtons(BuildContext context, List<Widget> actions) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
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
        style: PokeAppText.body3Style.copyWith(
          color: colors(context).textOnForeground,
        ),
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
