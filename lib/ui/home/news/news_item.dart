import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_applicaiton/model/NewsResponse.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:news_applicaiton/utils/app_styles.dart';
import 'package:news_applicaiton/utils/assets_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

main() {
  final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));

  print(timeago.format(fifteenAgo)); // 15 minutes ago
  print(timeago.format(fifteenAgo, locale: 'en_short')); // 15m
  print(timeago.format(fifteenAgo, locale: 'es')); // hace 15 minutos
}

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.009,
      ),
      height: height * 0.4,
      width: width * 0.91,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).indicatorColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.25,
            width: width * 0.877,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
            ),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.greyColor,),),
              errorWidget: (context, url, error) => Image.asset(AssetsManager.imageNotFound, fit: BoxFit.fill,),
            ),
          ),
          SizedBox(height:  height * 0.011,),
          Expanded(
            child: Text(news.title ?? '' ,
              style: Theme.of(context).textTheme.labelLarge,),
          ),
          SizedBox(height:  height * 0.011,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                    child: Text('By: ${news.author ?? ''}',style: AppStyles.medium12Grey,)),
                Expanded(child: SizedBox(width: width * 0.01,)),
                Expanded(
                  flex: 1,
                    child: Text(timeAgo() ?? '', style: AppStyles.medium12Grey,))
              ],
            ),
          )
        ],
      ),
    );
  }
  String timeAgo(){
    var publishedTime = DateTime.parse(news.publishedAt!);
    final time = DateTime.now().difference(publishedTime);
    final fifteenAgo = DateTime.now().subtract(time);
    return timeago.format(fifteenAgo);
  }
}
