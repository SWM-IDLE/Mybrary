import 'package:flutter/material.dart';
import 'package:mybrary/res/colors/color.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final followTextStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: GREY_01_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 82.0,
              height: 82.0,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: BOOK_BORDER_COLOR),
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    // 프로필 임시 이미지
                    'https://cdn.mydaily.co.kr/FILES/202107/202107312311265373_1.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '박보영',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 2.0),
            Wrap(
              spacing: 5,
              children: [
                Text('팔로워', style: followTextStyle),
                Text('264', style: followTextStyle),
                SizedBox(width: 6.0),
                Text('팔로잉', style: followTextStyle),
                Text('123', style: followTextStyle),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              '#초보 리뷰어',
              style: TextStyle(
                color: GREY_06_COLOR,
                fontSize: 11.0,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}