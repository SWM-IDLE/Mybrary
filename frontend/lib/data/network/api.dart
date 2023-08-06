import 'dart:developer';

import 'package:dio/dio.dart';

const baseUrl = "http://43.200.200.185:8003";
const bookServiceUrl = "http://43.200.200.185:8004";
const mybraryUrlScheme = "kr.mybrary";

enum API {
  // oauth
  naverLogin,
  kakaoLogin,
  googleLogin,
  // user-service
  getInterestCategories,
  getUserInterests,
  getUserFollowers,
  getUserFollowings,
  updateUserFollowing,
  deleteUserFollower,
  deleteUserFollowing,
  getUserProfile,
  getUserProfileImage,
  editUserProfile,
  editUserProfileImage,
  deleteUserProfileImage,
  // book-service
  getBookService,
  getBookSearchKeyword,
  getBookSearchIsbn,
}

Map<API, String> apiMap = {
  // oauth
  API.naverLogin: "/oauth2/authorization/naver",
  API.kakaoLogin: "/oauth2/authorization/kakao",
  API.googleLogin: "/oauth2/authorization/google",
  // user-service
  API.getInterestCategories: "/api/v1/interest-categories",
  API.getUserInterests: "/api/v1/users", // '/{userId}/interests'
  API.getUserFollowers: "/api/v1/users/followers",
  API.getUserFollowings: "/api/v1/users/followings",
  API.updateUserFollowing: "/api/v1/users/follow",
  API.deleteUserFollower: "/api/v1/users/follower",
  API.deleteUserFollowing: "/api/v1/users/follow",
  API.getUserProfile: "/api/v1/users/profile",
  API.getUserProfileImage: "/api/v1/users/profile/image",
  API.editUserProfile: "/api/v1/users/profile",
  API.editUserProfileImage: "/api/v1/users/profile/image",
  API.deleteUserProfileImage: "/api/v1/users/profile/image",
  // book-service
  API.getBookService: "/api/v1",
  API.getBookSearchKeyword: "/api/v1/books/search",
  API.getBookSearchIsbn: "/api/v1/books/search/isbn",
};

String getApi(API apiType) {
  String api = baseUrl;
  api += apiMap[apiType]!;
  return api;
}

String getBookServiceApi(API apiType) {
  String api = bookServiceUrl;
  api += apiMap[apiType]!;
  return api;
}

commonResponseResult(
  Response<dynamic> response,
  Function successCallback,
) {
  try {
    switch (response.statusCode) {
      case 200:
        return successCallback();
      case 404:
        log('ERROR: 서버에 404 에러가 있습니다.');
        return response.data;
      default:
        log('ERROR: 서버의 API 호출에 실패했습니다.');
        throw Exception('서버의 API 호출에 실패했습니다.');
    }
  } on DioException catch (error) {
    if (error.response != null) {
      throw Exception('${error.response!.data['errorMessage']}');
    }
    throw Exception('서버 요청에 실패했습니다.');
  }
}
