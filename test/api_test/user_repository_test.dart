import 'dart:typed_data';

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ftests/unit_test/counter_app/api_test/user_model.dart';
import 'package:ftests/unit_test/counter_app/api_test/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(
    () {
      userRepository = UserRepository(MockHTTPClient());
      mockHTTPClient = MockHTTPClient();
    },
  );
  group('UserRepository-', () {
    group('get user function', () {
      test(
          'given userRepository class when getUser function is called and status code is 200 then a usermodel should be returned',
          () async {
        when(
          () => mockHTTPClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),
        ).thenAnswer((inovation) async {
          return Response(
              '''{
                    "id": 1,
                    "name": "Leanne Graham",
                    "username": "Bret",
                    "email": "Sincere@april.biz",
                    "website": "hildegard.org"
                  } ''',
              200);
        });
        final user = await userRepository.getUser();
        expect(user, isA<User>());
      });
      test(
          'given userRepository class when getUser function is called and statuscode is not 200',
          () async {
        when(() => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            )).thenAnswer((invocation) async {
          return Response('{}', 500);
        });

        final user = userRepository.getUser();
        expect(user, throwsException);
      });
    });
  });
}
