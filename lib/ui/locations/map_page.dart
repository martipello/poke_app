import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

import '../../extensions/build_context_extension.dart';
import '../../extensions/double_extension.dart';
import '../../extensions/int_extension.dart';
import '../../theme/base_theme.dart';
import '../../utils/console_output.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/pokeball_loading_widget.dart';

const kMaxZoom = 100;
const kMinZoom = 0;

const kMinScale = 0.00;
const kDefaultScale = 0.1;
const kMaxScale = 1.0;

class LocationMapPageArguments {
  LocationMapPageArguments({
    required this.generationId,
    this.primaryColor,
    this.secondaryColor,
  });

  final int generationId;
  final Color? primaryColor;
  final Color? secondaryColor;
}

class LocationMapPage extends StatefulWidget {
  static const String routeName = '/location_map_view';

  @override
  State<LocationMapPage> createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  LocationMapPageArguments get locationMapArguments => context.routeArguments as LocationMapPageArguments;

  Color? get primaryColor => locationMapArguments.primaryColor;

  Color? get secondaryColor => locationMapArguments.secondaryColor;

  final photoViewController = PhotoViewController();

  @override
  void dispose() {
    photoViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor ?? Colors.red,
      ),
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: colors(context).cardBackground,
          ),
          child: Stack(
            children: [
              _buildMap(),
              _buildAppBar(context),
              Align(
                alignment: Alignment.bottomRight,
                child: _buildMapControl(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.statusBarHeight,
        ),
        ClippedAppBar(
          clipColor: primaryColor,
          onBackTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildMap() {
    return Center(
      child: PhotoView(
        initialScale: kDefaultScale,
        minScale: kMinScale,
        maxScale: kMaxScale,
        enablePanAlways: true,
        controller: photoViewController,
        imageProvider: const AssetImage(
          'assets/images/kanto_region_map.webp',
        ),
        loadingBuilder: (context, chunk) {
          return const PokeballLoadingWidget();
        },
      ),
    );
  }

  Widget _buildMapControl() {
    return StreamBuilder<PhotoViewControllerValue>(
      stream: photoViewController.outputStateStream,
      builder: (context, snapshot) {
        final photoViewControllerValue = snapshot.data;
        log('tag').d('value ${photoViewControllerValue?.scale}');
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 80,
            child: StepperSwipe(
              maxValue: kMaxZoom,
              minValue: kMinZoom,
              initialValue: 0,
              stepperValue: photoViewControllerValue?.scale?.scaleToZoom() ?? 1,
              speedTransitionLimitCount: 3,
              firstIncrementDuration: const Duration(
                milliseconds: 150,
              ),
              secondIncrementDuration: const Duration(
                milliseconds: 50,
              ),
              direction: Axis.vertical,
              dragButtonColor: primaryColor ?? Colors.red,
              withPlusMinus: true,
              withFastCount: true,
              onChanged: (value) {
                final difference = ((value - (photoViewController.scale.scaleToZoom())).floor());
                final differenceNormalized = difference.abs().round();
                if (value.zoomToScale() > (photoViewController.scale ?? kDefaultScale)) {
                  increaseZoom(differenceNormalized);
                } else {
                  decreaseZoom(differenceNormalized);
                }
              },
            ),
          ),
        );
      },
    );
  }

  void increaseZoom(int increaseBy) {
    final newValue = (photoViewController.scale ?? kDefaultScale).scaleToZoom() + (increaseBy * 10);
    photoViewController.scale = newValue.zoomToScale();
  }

  void decreaseZoom(int decreaseBy) {
    final newValue = (photoViewController.scale ?? kDefaultScale).scaleToZoom() - (decreaseBy * 10);
    photoViewController.scale = newValue.zoomToScale();
  }
}
