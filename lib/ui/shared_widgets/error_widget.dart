import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../../api/models/api_response.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../flavors.dart';
import '../../services/launch_service.dart';
import '../../theme/poke_app_text.dart';
import '../../utils/constants.dart';
import 'poke_dialog.dart';
import 'rounded_button.dart';
import 'view_constraint.dart';

class ErrorWidget extends StatelessWidget {
  ErrorWidget({
    Key? key,
    this.onTryAgain,
    this.showImage = false,
    this.error,
    this.errorMessage,
    this.retryLabel,
    this.textAlign,
  }) : super(key: key);

  final VoidCallback? onTryAgain;
  final ApiResponse? error;
  final TextAlign? textAlign;
  final String? errorMessage;
  final String? retryLabel;
  final bool showImage;

  final _launcherService = getIt.get<LaunchService>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ViewConstraint(
        constraints: const BoxConstraints(maxWidth: kMaxScreenWidth / 2),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showImage)
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24.0,
                  ),
                  child: Image.asset(
                    'assets/images/pika_detective.png',
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildInfoIcon(context),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      errorMessage ?? context.strings.errorMessage,
                      style: PokeAppText.body2Style,
                      textAlign: textAlign ?? TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              if (onTryAgain != null)
                RoundedButton(
                  label: retryLabel ?? context.strings.retry,
                  disableShadow: true,
                  fillColor: context.colors.surface,
                  onPressed: onTryAgain,
                  textStyle: PokeAppText.body3Style.copyWith(
                    color: context.colors.onSurface,
                  ),
                  outlineColor: context.colors.error,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoIcon(
    BuildContext context,
  ) {
    return IconButton(
      icon: const Icon(
        Icons.info_outline,
        size: 18,
      ),
      color: context.colors.onSurface,
      onPressed: () {
        _showErrorDialog(context, error);
      },
    );
  }

  Future _showErrorDialog(
    BuildContext context,
    ApiResponse? error,
  ) async {
    final errorCode = error?.error?.statusCode ?? 'No error code';
    final errorMessage = error?.message ?? error?.data?.toString() ?? 'No error message';
    return PokeDialog(
      title: 'Error',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 8,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: (context.screenHeight - 200),
            ),
            child: SingleChildScrollView(
              child: Text(
                'Message : $errorMessage',
                style: PokeAppText.body4Style.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Code : $errorCode',
            style: PokeAppText.body4Style.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
      dialogActions: [
        DialogAction(
          actionText: 'Send Report',
          actionVoidCallback: () async {
            final mailToUri = await _createMailToUri(context);
            _launcherService.launchEvent(
              context,
              mailToUri,
            );
          },
        ),
      ],
    ).show(context);
  }

  Future<Uri> _createMailToUri(
    BuildContext context,
  ) async {
    final errorMessage = error?.error?.message ?? 'No error message';
    final errorCode = error?.error?.statusCode ?? 'No error code';
    final errorUrl = error?.error?.url ?? 'No url';
    final packageInfo = await getIt.getAsync<PackageInfo>();
    final appName = packageInfo.appName;
    final appVersion = packageInfo.version;
    final platformName = Theme.of(context).platform;
    final flavorName = F.title;
    const subject = 'PokeApp Error';
    final emailBody = '<br/>Name       : $appName.'
        '<br/>Platform   : $platformName.'
        '<br/>Version    : $appVersion.'
        '<br/>Flavor     : $flavorName.'
        '<br/>Url        : $errorUrl.'
        '<br/>Error      : $errorMessage.'
        '<br/>Error Code : $errorCode.';
    return Constants.kAppError.toEmailUri(
      queryParameters: {
        'subject': subject,
        'body': emailBody,
      },
    );
  }
}
