import 'package:flutter_test/flutter_test.dart';
import 'package:ftests/api_test/user_model.dart';
import 'package:ftests/api_test/user_repository.dart';

void main() {
  late UserRepository userRepository;
  setUp(
    () {
      userRepository = UserRepository();
    },
  );
  group('UserRepository-', () {
    group('get user function', () {
      test(
          'given userRepository class when getUser function is called and status code is 200 then a usermodel should be returned',
          () async {
        final user = await userRepository.getUser();
        expect(user, isA<User>());
      });
      test(
          'given userRepository class when getUser function is called and statuscode is not 200',
          () async {
        final user = await userRepository.getUser();
        expect(user, throwsException);
      });
    });
  });
}
