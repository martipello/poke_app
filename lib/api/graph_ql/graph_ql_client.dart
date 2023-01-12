import 'package:graphql/client.dart';
import 'package:path_provider/path_provider.dart';

import '../../flavors.dart';

class GraphQlClient {
  Future<GraphQLClient> getClient() async {
    final _link = HttpLink(
      'https://beta.pokeapi.co/graphql/v1beta',
    );
    final hiveStore = await _getHiveStore();
    final graphQlCache = GraphQLCache(
      store: hiveStore,
    );
    return GraphQLClient(
      cache: F.appFlavor == Flavor.paid ? graphQlCache : GraphQLCache(),
      link: _link,
    );
  }

  Future<HiveStore> _getHiveStore() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    return HiveStore.open(
      path: appDocumentDir.path,
    );
  }
}
