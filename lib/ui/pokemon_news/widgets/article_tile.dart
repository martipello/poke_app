import 'package:flutter/material.dart';

import '../../../api/models/news/article.dart';
import '../../../extensions/date_time_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/rounded_card.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final imageUrl = article.urlToImage ?? 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png';
    final showImage = imageUrl.isNotEmpty;
    final publishedAt = article.publishedAt.isToday() ? 'Today' : article.publishedAt.dayMonthYearFormat();

    return RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!showImage)
                IntrinsicHeight(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 120,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        article.title ?? 'Title',
                        style: PokeAppText.body2Style,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${article.source?.Name}',
                            style: PokeAppText.body6Style,
                          ),
                          Text(
                            publishedAt,
                            textAlign: TextAlign.end,
                            style: PokeAppText.captionStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
