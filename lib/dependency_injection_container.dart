import 'package:get_it/get_it.dart';

import 'api/api_client.dart';
import 'api/error_handler.dart';
import 'api/graph_ql/graph_ql_client.dart';
import 'api/graph_ql/pokemon_repository_graph_ql.dart';
import 'services/launch_service.dart';
import 'services/shared_preferences_service.dart';
import 'ui/pokemon_list/adapter/pokemon_paging_adapter.dart';
import 'ui/pokemon_list/view_models/pokemon_list_view_model.dart';
import 'ui/pokemon_list/view_models/search_app_bar_view_model.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => ApiClient(getIt()));
  getIt.registerLazySingleton(SharedPreferencesService.new);
  getIt.registerFactory(LaunchService.new);
  getIt.registerFactory(GraphQlClient.new);
  getIt.registerFactory(ErrorHandler.new);
  getIt.registerFactory(() => PokemonRepositoryGraphQl(getIt()));
  getIt.registerFactory(() => PokemonPagingAdapter(getIt(), getIt()));
  getIt.registerFactory(() => PokemonListViewModel(getIt()));
  getIt.registerFactory(SearchAppBarViewModel.new);
}
