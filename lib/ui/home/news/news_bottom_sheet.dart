import 'package:flutter/material.dart';
import 'package:news_applicaiton/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsBottomSheet extends StatelessWidget {
  News news;
  NewsBottomSheet({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.4847,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.009
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.28,
            width: width * 0.95,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
            ),
            child: Image.network(news.urlToImage!,fit: BoxFit.cover,),
          ),
          SizedBox(height: height * 0.009,),
          Text(news.content!,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: height * 0.009,),
          ElevatedButton(
            onPressed: (){
              _launchUrl();
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: width * 0.877,
              height: height * 0.065,
              child: Text('View Full Article',style: Theme.of(context).textTheme.bodyMedium),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).indicatorColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),

              ),
            )
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(news.url!);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
