import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../../../../config/theme/font_manager.dart';
import '../../domain/entities/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleEntity article;
  final bool isBookMarked;

  const ArticleDetailScreen({super.key, required this.article, required this.isBookMarked});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMd().format(DateTime.parse(article.publishedAt));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image with overlay
            Stack(
              children: [
                // TODO: Use CachedNetworkImage for better performance
                Image.network(
                  article.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: context.sizeHeight * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: AppSize.s18,
                  left: AppSize.s16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color:ColorManager.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: AppSize.s18,
                  right : AppSize.s16,
                  child: IconButton(
                    icon: Icon(Icons.bookmark_border, color:ColorManager.white),
                    onPressed: () {
                      // TODO: Handle bookmark
                    },
                  ),
                ),
              ],
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    article.title,
                    style: getBoldStyle(color: ColorManager.textPrimary, fontSize: FontSize.s22),
                  ),
                  verticalSpace(AppSize.s8),
                  Text(
                    "$formattedDate • ${article.author} • ${article.sourceName}",
                    style: getRegularStyle(color: ColorManager.textSecondary, fontSize: FontSize.s14),
                  ),
                  verticalSpace(AppSize.s8),
                  Text(
                    article.description,
                    style:getMediumStyle(color: ColorManager.textPrimary, fontSize: FontSize.s16),
                  ),
                  verticalSpace(AppSize.s8),
                  Text(
                    article.content.replaceAll(RegExp(r'\[\+\d+ chars\]'), ""),
                    style: getMediumStyle(color: ColorManager.textPrimary, fontSize: FontSize.s16),
                  ),
                  if (article.content.contains("[+")) 
                    TextButton(
                      onPressed: () async {
                        final url = Uri.parse(article.url);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        }else{
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text("Read More"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
