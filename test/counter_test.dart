import 'package:flutter_test/flutter_test.dart';
import 'package:ftests/counter_app/counter.dart';

void main() {
  late Counter counter; //pre test
  setUp(() {
    counter = Counter();
  });

//Testing
  group('Counter Class -', () {
    test(
      "given counter class when it is instantiatedd then value of count should be 0 ",
      () {
        final val = counter.count;
        expect(val, 0);
      },
    );
    test(
        "given counter class when it is incremented then the value of the count should be 1",
        () {
      ///Arrange

      ///Act
      counter.incrementCounter();
      final val = counter.count;

      ///Assert
      expect(val, 1);
    });
    test(
        "Given counter class when it is decremented then the value of count should be -1",
        () {
      counter.decrementCounter();
      final val = counter.count;
      expect(val, -1);
    });
    test(
        "Given counter clqass when it is reset then the value of the count should be 0",
        () {
      counter.reset();
      final val = counter.count;
      expect(val, 0);
    });
  });
}
