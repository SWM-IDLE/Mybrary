import 'package:flutter/material.dart';
import 'package:mybrary/data/model/home/book_list_by_category_response.dart';
import 'package:mybrary/res/constants/color.dart';
import 'package:mybrary/res/constants/config.dart';
import 'package:mybrary/res/constants/style.dart';

class HomeRecommendBooks extends StatelessWidget {
  final String category;
  final List<Books> bookListByCategory;
  final void Function(String) onTapCategory;
  final void Function(String) onTapBook;

  const HomeRecommendBooks({
    required this.category,
    required this.bookListByCategory,
    required this.onTapCategory,
    required this.onTapBook,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            bottom: 12.0,
          ),
          child: Row(
            children: [
              Text(
                '추천 도서, ',
                style: commonSubBoldStyle,
              ),
              Text(
                '이건 어때요?',
                style: commonMainRegularStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
              bookListByInterestedCategory.length,
              (index) => InkWell(
                onTap: () {
                  onTapCategory(bookListByInterestedCategory[index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 19.0,
                    vertical: 7.0,
                  ),
                  decoration: BoxDecoration(
                    color: category == bookListByInterestedCategory[index]
                        ? grey262626
                        : commonWhiteColor,
                    border: Border.all(
                      color: grey777777,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    bookListByInterestedCategory[index],
                    style: categoryCircularTextStyle.copyWith(
                      color: category == bookListByInterestedCategory[index]
                          ? commonWhiteColor
                          : grey262626,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: bookListByCategory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                  children: [
                    if (index == 0)
                      const SizedBox(
                        width: 16.0,
                      ),
                    InkWell(
                      onTap: () {
                        onTapBook(bookListByCategory[index].isbn13!);
                      },
                      child: Container(
                        width: 116,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              bookListByCategory[index].thumbnailUrl!,
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 2,
                              offset: Offset(1, 1),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                    if (index == bookListByCategory.length - 1)
                      const SizedBox(
                        width: 8.0,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}