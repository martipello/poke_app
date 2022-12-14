import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ads/view_models/google_ads_view_model.dart';
import 'api/api_client.dart';
import 'api/error_handler.dart';
import 'api/graph_ql/graph_ql_client.dart';
import 'api/graph_ql/pokemon_repository_graph_ql.dart';
import 'services/language_service.dart';
import 'services/launch_service.dart';
import 'services/shared_preferences_service.dart';
import 'services/theme_service.dart';
import 'ui/locations/view_models/map_zoom_control_view_model.dart';
import 'ui/pokemon_evolutions/view_models/pokemon_evolution_view_model.dart';
import 'ui/pokemon_forms/view_models/pokemon_forms_view_model.dart';
import 'ui/pokemon_info/view_models/pokemon_encounter_view_model.dart';
import 'ui/pokemon_info/view_models/pokemon_info_view_model.dart';
import 'ui/pokemon_list/adapters/pokemon_paging_adapter.dart';
import 'ui/pokemon_list/view_models/filter_view_model.dart';
import 'ui/pokemon_list/view_models/pokemon_list_view_model.dart';
import 'ui/pokemon_list/view_models/search_view_model.dart';
import 'ui/pokemon_moves/adapters/moves_paging_adapter.dart';
import 'ui/pokemon_moves/view_models/pokemon_moves_view_model.dart';
import 'ui/pokemon_stats/view_models/pokemon_stats_weakness_resistance_view_model.dart';
import 'ui/shared_widgets/view_models/current_index_view_model.dart';
import 'ui/shared_widgets/view_models/expansion_card_state_view_model.dart';
import 'ui/shared_widgets/view_models/image_color_view_model.dart';
import 'ui/shared_widgets/view_models/pokeball_loading_view_model.dart';
import 'ui/shared_widgets/view_models/spash_view_model.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingletonAsync(SharedPreferences.getInstance);
  getIt.registerLazySingletonAsync(PackageInfo.fromPlatform);
  getIt.registerLazySingleton(() => ApiClient(getIt()));
  getIt.registerLazySingleton(SharedPreferencesService.new);
  getIt.registerLazySingleton(() => LanguageService(getIt()));
  getIt.registerLazySingleton(() => ThemeService(getIt()));
  getIt.registerLazySingleton(GraphQlClient.new);
  getIt.registerFactory(LaunchService.new);
  getIt.registerFactory(ErrorHandler.new);
  getIt.registerFactory(() => PokemonRepositoryGraphQl(getIt()));
  getIt.registerFactory(() => PokemonPagingAdapter(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => MovesPagingAdapter(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => PokemonListViewModel(getIt()));
  getIt.registerFactory(() => PokemonInfoViewModel(getIt(), getIt(), getIt()));
  getIt.registerFactory(PokemonEncounterViewModel.new);
  getIt.registerFactory(GoogleAdsViewModel.new);
  getIt.registerFactory(() => PokemonMovesViewModel(getIt()));
  getIt.registerFactory(() => PokemonFormsViewModel(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => PokemonEvolutionViewModel(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => PokemonStatsWeaknessResistanceViewModel(getIt(), getIt(), getIt()));
  getIt.registerFactory(FilterViewModel.new);
  getIt.registerFactory(SearchViewModel.new);
  getIt.registerFactory(CurrentIndexViewModel.new);
  getIt.registerFactory(MapZoomControlViewModel.new);
  getIt.registerFactory(SplashViewModel.new);
  getIt.registerFactory(ExpansionCardStateViewModel.new);
  getIt.registerFactory(PokeballLoadingViewModel.new);
  getIt.registerFactory(ImageColorViewModel.new);
  await _initServices();
}

Future<void> _initServices() async {
  final _sharedPreferencesServices = getIt.get<SharedPreferencesService>();
  final _languageService = getIt.get<LanguageService>();
  final _themeService = getIt.get<ThemeService>();
  _themeService.init();
  _languageService.init();
  _sharedPreferencesServices.init();
}
