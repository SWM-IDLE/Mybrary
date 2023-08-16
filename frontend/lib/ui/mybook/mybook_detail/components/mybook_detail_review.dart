import 'package:flutter/material.dart';
import 'package:mybrary/res/constants/style.dart';
import 'package:mybrary/utils/logics/book_utils.dart';

class MyBookDetailReview extends StatelessWidget {
  final String content;
  final double starRating;
  final String createdAt;
  final String thumbnailUrl;
  final String title;
  final List<String> authors;
  final TextEditingController contentController;
  final int reviewId;
  final void Function({
    required bool isCreateReview,
    required String thumbnailUrl,
    required String title,
    required List<String> authors,
    required double starRating,
    required TextEditingController contentController,
    int? myBookId,
    int? reviewId,
  }) nextToMyBookReview;

  const MyBookDetailReview({
    required this.content,
    required this.starRating,
    required this.createdAt,
    required this.thumbnailUrl,
    required this.title,
    required this.authors,
    required this.reviewId,
    required this.contentController,
    required this.nextToMyBookReview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '마이 리뷰',
                  style: commonSubBoldStyle,
                ),
                InkWell(
                  onTap: () {
                    nextToMyBookReview(
                      isCreateReview: false,
                      thumbnailUrl: thumbnailUrl,
                      title: title,
                      authors: authors,
                      contentController: contentController,
                      starRating: starRating,
                      reviewId: reviewId,
                    );
                  },
                  child: Text(
                    '작성하기',
                    style: bookDetailDescriptionStyle.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                starRatingRow(starRating),
                const SizedBox(width: 10.0),
                Text(
                  '$starRating',
                  style: commonSubBoldStyle.copyWith(
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Text(
              content,
              style: bookDetailSubStyle,
            ),
            const SizedBox(height: 5.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                createdAt,
                style: bookDetailSubStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}