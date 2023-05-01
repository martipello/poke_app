import '../../../services/language_service.dart';
import '../../models/news/news_response.dart';
import '../../models/pokemon/pokemon_request.dart';
import '../api_client.dart';

const kApiKey = '241c2dd56e414ee49b09a4b401e45058';

class NewsRepository {
  NewsRepository(this.apiClient);

  final ApiClient apiClient;


  Future<NewsResponse> getTopHeadlinePokemonNews(PokemonRequest request) async {
    final uriComponent = _createTopHeadlinePokemonNewsUriComponents(request);
    final url = 'top-headlines?q=pokemon&$uriComponent';
    final response = await apiClient.get(url: url);
    print('response $response');
    return NewsResponse.fromJson(response);
  }

  Future<NewsResponse> getEverythingPokemonNews(PokemonRequest request) async {
    final uriComponent = _createEverythingPokemonNewsUriComponents(request);
    final url = 'everything?q=pokemon&$uriComponent';
    final response = await apiClient.get(url: url);
    return NewsResponse.fromJson(response);
  }

  String _createEverythingPokemonNewsUriComponents(
    PokemonRequest request,
  ) {
    final pageSize = request.limit;
    final page = (request.skip ?? 0) + 1;
    return 'apiKey=$kApiKey'
        '&pageSize=$pageSize'
        '&page=$page';
  }

  String _createTopHeadlinePokemonNewsUriComponents(
    PokemonRequest request,
  ) {
    final pageSize = request.limit;
    final language = SupportedLanguage.getSupportedLanguageById(
          request.languageId ?? 0,
        ).locale.countryCode ??
        'us';
    final page = (request.skip ?? 0) + 1;
    return 'apiKey=$kApiKey'
        '&country=$language'
        '&pageSize=$pageSize'
        '&page=$page';
  }
}
