// we should test every single method that exists in userModel
//how to do that ??
//group testing for every method

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:project1/core/utils/typedef.dart';
import 'package:project1/src/auth/data/models/user_model.dart';
import 'package:project1/src/auth/domain/entities/user.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = UserModel.empty();
  final tJSON = fixture('user.json');
  final tMap = jsonDecode(tJSON) as DataMap;
  // make sure your model is subclass of entity
  test('should be a subclass of User entity', () {
    //arrange
    final tModel = UserModel.empty();

    // assert
    expect(tModel, isA<User>());
  });

  group('from/to Map', () {
    test('should return a [userModel] with the right data', () {
      //action
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
      //assert
    });

    test("should return a valid map", () {
      //action
      final result = tModel.toMap();
      //assert
      expect(result, equals(tMap));
    });
  });

  group('from/to JSON', () {
    test('should return a [userModel] with the right data', () {
      //action
      final result = UserModel.fromJson(tJSON);
      expect(result, equals(tModel));
      //assert
    });

    test("should return a valid json", () {
      //action
      final result = tModel.toJson();
      final tjson = jsonEncode({
        "id": "1",
        "createdAt": "2024-10-14T08:07:16.661Z",
        "name": "Cesar Konopelski",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/561.jpg"
      });
      //assert
      expect(result, tjson);
    });
  });
  test("copy with ", () {
    final result = tModel.copyWith(name: 'hanane');
    const expectedModel = UserModel(
        id: "1",
        createdAt: "2024-10-14T08:07:16.661Z",
        name: "hanane",
        avatar:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/561.jpg");
    expect(result, expectedModel);
  });
}
