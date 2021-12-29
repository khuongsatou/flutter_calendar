import 'package:app_calendar/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Counter value should be increment", () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 2);
  });
}
