import 'package:flutter/material.dart';
import 'package:mybrary/res/colors/color.dart';
import 'package:mybrary/res/constants/style.dart';

class ProfileHeader extends StatelessWidget {
  final String nickname;
  final String profileImageUrl;

  const ProfileHeader({
    required this.nickname,
    required this.profileImageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
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
                  side: const BorderSide(
                    width: 2,
                    color: BOOK_BORDER_COLOR,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '$profileImageUrl?time=${DateTime.now().millisecondsSinceEpoch}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(nickname,
                style: commonSubTitleStyle.copyWith(
                  fontSize: 18.0,
                )),
            const SizedBox(height: 2.0),
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
            const SizedBox(height: 8.0),
            Text(
              '#초보 리뷰어',
              style: commonSubThinStyle,
            )
          ],
        ),
      ),
    );
  }
}
