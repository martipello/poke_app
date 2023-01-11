import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/double_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import 'view_models/map_zoom_control_view_model.dart';

const kMinScale = 0.1;
const kDefaultScale = 0.1;
const kMaxScale = 1.0;

class LocationMapPageArguments {
  LocationMapPageArguments({
    required this.generationName,
    this.primaryColor,
    this.secondaryColor,
  });

  final String generationName;
  final Color? primaryColor;
  final Color? secondaryColor;
}

class LocationMapPage extends StatefulWidget {
  static const String routeName = '/location_map_view';

  @override
  State<LocationMapPage> createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  final mapZoomControlViewModel = getIt.get<MapZoomControlViewModel>();

  LocationMapPageArguments get locationMapArguments => context.routeArguments as LocationMapPageArguments;

  Color? get primaryColor => locationMapArguments.primaryColor;

  Color? get secondaryColor => locationMapArguments.secondaryColor;

  final photoViewController = PhotoViewController();

  @override
  void initState() {
    super.initState();
    photoViewController.outputStateStream.listen(
      (event) {
        mapZoomControlViewModel.zoomStream.add(
          event.scale.scaleToZoom().toDouble(),
        );
      },
    );
  }

  @override
  void dispose() {
    photoViewController.dispose();
    mapZoomControlViewModel.dispose();
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
                child: _buildMapControls(),
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
        controller: photoViewController,
        imageProvider: AssetImage(
          _mapForGenerationId(
            locationMapArguments.generationName,
          ),
        ),
        loadingBuilder: (context, chunk) {
          return const PokeballLoadingWidget();
        },
      ),
    );
  }

  Widget _buildMapControls() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: _buildZoomControl(),
    );
  }

  Widget _buildZoomControl() {
    return StreamBuilder<double?>(
      stream: mapZoomControlViewModel.zoomStream,
      builder: (context, snapshot) {
        final currentZoom = snapshot.data ?? 0;
        return Container(
          decoration: BoxDecoration(
            color: colors(context).white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(90),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIncreaseZoomButton(
                currentZoom,
              ),
              _buildZoomLabel(currentZoom),
              _buildDecreaseZoomButton(
                currentZoom,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildZoomLabel(
    double currentZoom,
  ) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(360),
      ),
      child: Center(
        child: Text(
          currentZoom.removeTrailingZero(),
          style: PokeAppText.subtitle2Style.copyWith(
            color: colors(context).white,
          ),
        ),
      ),
    );
  }

  Widget _buildIncreaseZoomButton(
    double currentZoom,
  ) {
    return IconButton(
      onPressed: currentZoom < kMaxZoom
          ? () {
              photoViewController.scale = (currentZoom + 1).zoomToScale();
            }
          : null,
      icon: Icon(
        Icons.add,
        color: colors(context).white,
      ),
    );
  }

  Widget _buildDecreaseZoomButton(
    double currentZoom,
  ) {
    return IconButton(
      onPressed: currentZoom > kMinZoom
          ? () {
              photoViewController.scale = (currentZoom - 1).zoomToScale();
            }
          : null,
      icon: Icon(
        Icons.remove,
        color: colors(context).white,
      ),
    );
  }

  String _mapForGenerationId(String generationName) {
    switch (generationName) {
      case 'red':
      case 'blue':
      case 'yellow':
      case 'firered':
      case 'leafgreen':
      case 'letsgopikachu':
      case 'letsgoeevee':
        //return KANTO
        return 'assets/images/kanto_region.webp';
      case 'gold':
      case 'silver':
      case 'crystal':
      case 'heartgold':
      case 'soulsilver':
      //return JHOTO KANTO
      case 'ruby':
      case 'sapphire':
      case 'omegaruby':
      case 'alphasapphire':
      case 'emerald':
        return 'assets/images/hoen_region.webp';
      case 'diamond':
      case 'pearl':
      case 'brilliantdiamond':
      case 'shiningpearl':
      case 'platinum':
      //return SINNOH
      case 'black':
      case 'white':
      case 'black2':
      case 'white2':
      //return UNOVA
      case 'x':
      case 'y':
        //return KALOS
        return 'assets/images/kalos_region.webp';
      case 'sun':
      case 'moon':
      case 'ultrasun':
      case 'ultramoon':
        //return ALOLA
        return 'assets/images/alola_region.jpg';
      case 'swordandshield':
      //return GALAR
      case 'arceus':
      //return HISUI
      case 'scarlet':
      case 'violet':
      //return PALDEA
      default:
        return 'assets/images/kanto_region.webp';
    }
  }
}
