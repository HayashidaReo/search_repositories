// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:search_repositories/feature/github/model/api_owner_response.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';

void main() {
  group('ApiResponse', () {
    test('JSONからApiResponseへの変換が正しく行われる', () {
      // テスト用のJSONデータ
      final json = {
        'name': 'flutter',
        'description':
            'Flutter makes it easy and fast to build beautiful apps for mobile and beyond.',
        'language': 'Dart',
        'stargazers_count': 148000,
        'watchers_count': 148000,
        'forks_count': 24000,
        'open_issues_count': 11000,
        'html_url': 'https://github.com/flutter/flutter',
        'owner': {
          'login': 'flutter',
          'avatar_url': 'https://avatars.githubusercontent.com/u/14101776?v=4',
        },
      };

      // JSONからApiResponseオブジェクトへ変換
      final apiResponse = ApiResponse.fromJson(json);

      // 変換されたオブジェクトの各フィールドが正しいか検証
      expect(apiResponse.name, 'flutter');
      expect(
        apiResponse.description,
        'Flutter makes it easy and fast to build beautiful apps for mobile and beyond.',
      );
      expect(apiResponse.language, 'Dart');
      expect(apiResponse.stargazersCount, 148000);
      expect(apiResponse.watchersCount, 148000);
      expect(apiResponse.forksCount, 24000);
      expect(apiResponse.openIssuesCount, 11000);
      expect(apiResponse.htmlUrl, 'https://github.com/flutter/flutter');

      // ownerのフィールドも検証
      expect(apiResponse.owner.login, 'flutter');
      expect(
        apiResponse.owner.avatarUrl,
        'https://avatars.githubusercontent.com/u/14101776?v=4',
      );
    });

    test('ApiResponseオブジェクトの作成と取得が正しく行われる', () {
      // ApiOwnerResponseオブジェクトの作成
      final owner = ApiOwnerResponse(
        login: 'test-user',
        avatarUrl: 'https://example.com/avatar.png',
      );

      // ApiResponseオブジェクトの作成
      final apiResponse = ApiResponse(
        name: 'test-repo',
        description: 'テスト用リポジトリ',
        language: 'Dart',
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 10,
        htmlUrl: 'https://github.com/test/test-repo',
        owner: owner,
      );

      // フィールドが正しく設定されているか検証
      expect(apiResponse.name, 'test-repo');
      expect(apiResponse.description, 'テスト用リポジトリ');
      expect(apiResponse.language, 'Dart');
      expect(apiResponse.stargazersCount, 100);
      expect(apiResponse.watchersCount, 50);
      expect(apiResponse.forksCount, 25);
      expect(apiResponse.openIssuesCount, 10);
      expect(apiResponse.htmlUrl, 'https://github.com/test/test-repo');

      // ownerオブジェクトも検証
      expect(apiResponse.owner.login, 'test-user');
      expect(apiResponse.owner.avatarUrl, 'https://example.com/avatar.png');
    });

    test('nullable フィールドのテスト', () {
      // descriptionとlanguageがnullのJSONデータ
      final json = {
        'name': 'minimal-repo',
        'stargazers_count': 10,
        'watchers_count': 10,
        'forks_count': 5,
        'open_issues_count': 2,
        'html_url': 'https://github.com/test/minimal-repo',
        'owner': {
          'login': 'test-user',
          'avatar_url': 'https://example.com/avatar.png',
        },
      };

      // JSONからApiResponseオブジェクトへ変換
      final apiResponse = ApiResponse.fromJson(json);

      // nullableフィールドがnullになっているか検証
      expect(apiResponse.description, null);
      expect(apiResponse.language, null);

      // 他のフィールドは正常に変換されているか
      expect(apiResponse.name, 'minimal-repo');
      expect(apiResponse.stargazersCount, 10);
    });
  });
}
