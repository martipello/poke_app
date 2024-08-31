import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

import '../../api/models/region/region.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/double_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/no_results.dart';
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
  const LocationMapPage({super.key, required this.locationMapPageArguments});

  static const String routeName = '/location_map_view';

  @override
  State<LocationMapPage> createState() => _LocationMapPageState();

  final LocationMapPageArguments locationMapPageArguments;
}

class _LocationMapPageState extends State<LocationMapPage> {
  final mapZoomControlViewModel = getIt.get<MapZoomControlViewModel>();

  LocationMapPageArguments get locationMapArguments => widget.locationMapPageArguments;

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
            color: context.colors.surface,
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
            context.pop();
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
        imageProvider: NetworkImage(
            _mapForGenerationId(
              locationMapArguments.generationName,
            ),
            scale: 1),
        loadingBuilder: (context, chunk) {
          return const PokeballLoadingWidget();
        },
        errorBuilder: (context, error, stacktrace) {
          return NoResults(
            emptyMessage: context.strings.couldntFindMap,
          );
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
            color: context.colors.onSurface.withOpacity(0.4),
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
            color: context.colors.onPrimary,
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
        color: context.colors.onPrimary,
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
        color: context.colors.onPrimary,
      ),
    );
  }

  String _mapForGenerationId(
    String generationName,
  ) {
    switch (generationName) {
      case 'red':
      case 'blue':
      case 'yellow':
      case 'firered':
      case 'leafgreen':
      case 'letsgopikachu':
      case 'letsgoeevee':
        //return KANTO
        return Region.kanto.mapUrl;
      case 'gold':
      case 'silver':
      case 'crystal':
      case 'heartgold':
      case 'soulsilver':
        //return JHOTO (KANTO)
        return Region.johto.mapUrl;
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
        return Region.sinnoh.mapUrl;
      case 'black':
      case 'white':
      case 'black2':
      case 'white2':
        //return UNOVA
        return Region.unova.mapUrl;
      case 'x':
      case 'y':
        //return KALOS
        return Region.kalos.mapUrl;
      case 'sun':
      case 'moon':
      case 'ultrasun':
      case 'ultramoon':
        //return ALOLA
        return Region.alola.mapUrl;
      case 'swordandshield':
        //return GALAR
        return Region.galor.mapUrl;
      case 'arceus':
        //return HISUI
        return Region.hisui.mapUrl;
      case 'scarlet':
      case 'violet':
        //return PALDEA
        return Region.paldea.mapUrl;
      default:
        return 'assets/images/unknown_map.webp';
    }
  }
}
