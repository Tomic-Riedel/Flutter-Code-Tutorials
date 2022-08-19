// Import flutter_test and our counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/counter.dart';

// Main function that will run the tests
void main() {
  group(
    'Testing the counter values',
    () {
      test(
        // Call test function
        'Increment counter value', // Description of our test
        () {
          // Setup
          Counter counter = Counter(
            currentValue:
                2, // Set the inital value to two. We expect 3 after incrementing.
          );

          // Do
          counter.increment();

          // Test

          // The first value is the actual value, the second is the expected value.
          // If they are equal, the test passes, if not, the test fails.
          expect(counter.currentValue, 3);
        },
      );
      test(
          // Call test function
          'Decrement counter value', // Description of our test
          () {
        // Setup
        Counter counter = Counter(
          currentValue:
              2, // Set the inital value to two. We expect 3 after incrementing.
        );

        // Do
        counter.decrement();

        // Test

        // The first value is the actual value, the second is the expected value.
        // If they are equal, the test passes, if not, the test fails.
        expect(counter.currentValue, 1);
      });
    },
  );
}
