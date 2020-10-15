import 'package:test/test.dart';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

void main() {
  final IList<int> iList = [1, 2, 3].lock;
  final UnmodifiableListView<int> unmodifiableListView = UnmodifiableListView(iList);

  group("Basic Operations |", () {
    test("UnmodifiableListView.[] operator", () {
      expect(unmodifiableListView[0], 1);
      expect(unmodifiableListView[1], 2);
      expect(unmodifiableListView[2], 3);
    });

    test("UnmodifiableListView.length getter", () => expect(unmodifiableListView.length, 3));

    test("UnmodifiableListView.lock getter", () {
      expect(unmodifiableListView.lock, isA<IList<int>>());
      expect(unmodifiableListView.lock, [1, 2, 3]);
    });

    test("Emptiness properties", () {
      expect(unmodifiableListView.isEmpty, isFalse);
      expect(unmodifiableListView.isNotEmpty, isTrue);
    });

    test("UnmodifiableListView.from constructor", () {
      final UnmodifiableListView<int> unmodifiableListView = UnmodifiableListView.from([1, 2, 3]);

      expect(unmodifiableListView.lock, [1, 2, 3]);
      expect(unmodifiableListView.length, 3);
    });
  });

  group("Mutations are not allowed |", () {
    test("UnmodifiableListView.[]= operator",
        () => expect(() => unmodifiableListView[0] = 10, throwsUnsupportedError));

    test("UnmodifiableListView.length setter",
        () => expect(() => unmodifiableListView.length = 10, throwsUnsupportedError));

    test("UnmodifiableListView.add method",
        () => expect(() => unmodifiableListView.add(4), throwsUnsupportedError));

    test("UnmodifiableListView.addAll method",
        () => expect(() => unmodifiableListView.addAll([4, 5]), throwsUnsupportedError));

    test("UnmodifiableListView.remove method",
        () => expect(() => unmodifiableListView.remove(3), throwsUnsupportedError));
  });
}
