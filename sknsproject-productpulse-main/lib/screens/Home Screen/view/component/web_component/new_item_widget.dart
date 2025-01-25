import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/news_model.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemWidget({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsModel.title ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              Text(
                newsModel.description ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          // child: Image.network(
          //   newsModel.urlToImage ?? '',
          //   width: 60,
          //   height: 100,
          // ),
          child: CachedNetworkImage(
            imageUrl: newsModel.urlToImage ?? '',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
