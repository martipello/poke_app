import 'package:graphql/client.dart';
import 'package:path_provider/path_provider.dart';

class GraphQlClient {
  Future<GraphQLClient> getClient() async {
    final _link = HttpLink(
      'https://beta.pokeapi.co/graphql/v1beta',
    );
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final store = await HiveStore.open(
      path: appDocumentDir.path,
    );
    return GraphQLClient(
      cache: GraphQLCache(
        store: store,
      ),
      link: _link,
    );
  }
}
