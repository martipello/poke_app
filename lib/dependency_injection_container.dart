import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ads/view_models/google_ads_view_model.dart';
import 'api/error_handler.dart';
import 'api/graph_ql/graph_ql_client.dart';
import 'api/graph_ql/pokemon_repository_graph_ql.dart';
import 'api/models/pokemon/pokemon.dart';
import 'api/rest/api_client.dart';
import 'api/rest/news/news_repository.dart';
import 'in_app_purchases/view_models/in_app_purchase_view_model.dart';
import 'services/language_service.dart';
import 'services/launch_service.dart';
import 'services/shared_preferences_service.dart';
import 'services/theme_service.dart';
import 'ui/leaderboard/view_models/leaderboard_view_model.dart';
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
import 'ui/pokemon_news/adapter/pokemon_news_paging_adapter.dart';
import 'ui/pokemon_news/views_models/pokemon_news_list_view_model.dart';
import 'ui/pokemon_stats/view_models/pokemon_stats_weakness_resistance_view_model.dart';
import 'ui/shared_widgets/view_models/current_index_view_model.dart';
import 'ui/shared_widgets/view_models/expansion_card_state_view_model.dart';
import 'ui/shared_widgets/view_models/image_color_view_model.dart';
import 'ui/shared_widgets/view_models/open_pokemon_count_view_model.dart';
import 'ui/shared_widgets/view_models/pokeball_loading_view_model.dart';
import 'ui/shared_widgets/view_models/spash_view_model.dart';
import 'ui/whos_that_pokemon/view_models/score_view_model.dart';
import 'ui/whos_that_pokemon/view_models/whos_that_pokemon_view_model.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingletonAsync(SharedPreferences.getInstance);
  getIt.registerLazySingletonAsync(PackageInfo.fromPlatform);
  getIt.registerLazySingleton(
      () => FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'poke-app-dex-leaderboard'));
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => ApiClient(getIt()));
  getIt.registerLazySingleton(OpenPokemonCountViewModel.new);
  getIt.registerLazySingleton(SharedPreferencesService.new);
  getIt.registerLazySingleton(() => LanguageService(getIt()));
  getIt.registerLazySingleton(() => ThemeService(getIt()));
  getIt.registerLazySingleton(InAppPurchaseViewModel.new);
  getIt.registerLazySingleton(GraphQlClient.new);
  getIt.registerLazySingleton(() => PagingController<int, Pokemon>(firstPageKey: 0, invisibleItemsThreshold: 10));
  getIt.registerLazySingleton(() => PokemonPagingAdapter(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory(LaunchService.new);
  getIt.registerFactory(ErrorHandler.new);
  getIt.registerFactory(() => PokemonRepositoryGraphQl(getIt()));
  getIt.registerFactory(() => NewsRepository(getIt()));
  getIt.registerFactory(() => PokemonNewsPagingAdapter(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => MovesPagingAdapter(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => PokemonListViewModel(getIt()));
  getIt.registerFactory(() => PokemonNewsListViewModel(getIt(), getIt(), getIt()));
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
  getIt.registerFactory(() => WhosThatPokemonViewModel(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory(() => ScoreViewModel(getIt(), getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => LeaderboardViewModel(getIt()));
  getIt.registerFactory(ExpansionCardStateViewModel.new);
  getIt.registerFactory(PokeballLoadingViewModel.new);
  getIt.registerFactory(() => ImageColorViewModel(getIt()));
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
