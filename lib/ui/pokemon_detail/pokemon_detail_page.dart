import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/pokemon_extension.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../../utils/irregular_trapezium_clipper.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/pokemon_type_chip.dart';

class PokemonDetailPageArguments {
  PokemonDetailPageArguments({
    required this.pokemon,
    this.paletteGenerator,
  });

  final Pokemon pokemon;
  final PaletteGenerator? paletteGenerator;
}

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/detail';

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> with TickerProviderStateMixin {
  PokemonDetailPageArguments get pokemonDetailArguments => context.routeArguments as PokemonDetailPageArguments;

  final _scrollController = ScrollController();
  late final _tabBarController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              expandedHeight: 437,
              backgroundColor: colors(context).cardBackground,
              titleSpacing: 0,
              title: Stack(
                children: [
                  _buildAppBarClip(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: colors(context).cardBackground,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              leadingWidth: 0,
              automaticallyImplyLeading: false,
              centerTitle: false,
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.red,
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: _buildPokemonDetailHeader(),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            _buildTabBar(context),
            Expanded(
              child: TabBarView(
                controller: _tabBarController,
                children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [],
                  ),
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [],
                  ),
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonDetailHeader() {
    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Theme(
            data: ThemeData(
              cardTheme: _buildCardTheme(),
            ),
            child: const Card(
              child: SizedBox(
                height: 276,
                width: double.infinity,
              ),
            ),
          ),
        ),
        _buildPokemonDetailHeaderBody(),
      ],
    );
  }

  Widget _buildAppBarClip() {
    return ClipPath(
      clipper: IrregularTrapeziumClipper(),
      child: Container(
        height: kToolbarHeight,
        decoration: const BoxDecoration(color: Colors.red),
      ),
    );
  }

  Widget _buildPokemonDetailHeaderBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildExtraLargeMargin(),
          _buildPokemonImage(),
          _buildMediumMargin(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(),
              _buildPokemonId(),
            ],
          ),
          _buildSmallMargin(),
          _buildSpeciesName(),
          _buildSmallMargin(),
          _buildPokemonTypes(),
          _buildSmallMargin(),
          _buildGeneration(),
          _buildSmallMargin(),
          Row(
            children: [
              _buildHeight(),
              _buildMediumMargin(),
              _buildWeight(),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _buildExtraLargeMargin() {
    return const SizedBox(
      height: 72,
    );
  }

  PokemonImage _buildPokemonImage() {
    return PokemonImage(
      pokemon: pokemonDetailArguments.pokemon,
      size: const Size(
        200,
        200,
      ),
    );
  }

  Widget _buildSmallMargin() => const SizedBox(
        height: 8,
      );

  Widget _buildMediumMargin() => const SizedBox(
        height: 16,
        width: 16,
      );

  Widget _buildTitle() {
    final pokemonName = pokemonDetailArguments.pokemon.name ?? 'Unknown Pokemon';
    return Text(
      pokemonName.capitalize(),
      style: PokeAppText.title1Style,
    );
  }

  Widget _buildPokemonId() {
    final pokemonId = pokemonDetailArguments.pokemon.id ?? '??';
    return Text(
      '#${pokemonId.toString()}',
      style: PokeAppText.subtitle4Style,
    );
  }

  Widget _buildSpeciesName() {
    final speciesName =
        pokemonDetailArguments.pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ??
            'Unknown Species';
    return Text(
      speciesName.capitalize(),
      style: PokeAppText.title4Style,
    );
  }

  Widget _buildPokemonTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChipGroup(
          chips: pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes
              .map(
                (type) => PokemonTypeChip(
                  type: type.pokemon_v2_type?.pokemonType() ?? PokemonType.unknown,
                  chipType: ChipType.normal,
                ),
              )
              .toList(),
        )
      ],
    );
  }

  Widget _buildGeneration() {
    final pokemonGenerationId =
        pokemonDetailArguments.pokemon.pokemon_v2_pokemonspecy?.generation_id.toString() ?? 'Unknown';
    return Row(
      children: [
        const Text(
          'Generation : ',
          style: PokeAppText.body3Style,
        ),
        Text(
          pokemonGenerationId,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  Widget _buildHeight() {
    final pokemonHeight = pokemonDetailArguments.pokemon.pokemonHeight();
    return Row(
      children: [
        const Text(
          'Height : ',
          style: PokeAppText.body3Style,
        ),
        Text(
          pokemonHeight,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  Widget _buildWeight() {
    final pokemonWeight = pokemonDetailArguments.pokemon.pokemonWeight();
    return Row(
      children: [
        const Text(
          'Weight : ',
          style: PokeAppText.body3Style,
        ),
        Text(
          pokemonWeight,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  CardTheme _buildCardTheme() {
    return CardTheme(
      color: colors(context).white,
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabBarController,
      padding: const EdgeInsets.all(8),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(90), // Creates border
        color: Colors.red,
      ), //Change background color from here
      tabs: [
        Tab(
          text: context.strings.info,
        ),
        Tab(
          text: context.strings.stats,
        ),
        Tab(
          text: context.strings.moves,
        )
      ],
    );
  }
}
