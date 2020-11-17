import "package:test/test.dart";

import "package:fast_immutable_collections/fast_immutable_collections.dart";

void main() {
  test("Non-mutable operations | ModifiableListView.[] operator", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    expect(modifiableListView[0], 1);
    expect(modifiableListView[1], 2);
    expect(modifiableListView[2], 3);
  });

  test("Non-mutable operations | ModifiableListView.length", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    expect(modifiableListView.length, 3);
  });

  test("Non-mutable operations | ModifiableListView.lock", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    expect(modifiableListView.lock, isA<IList<int>>());
    expect(modifiableListView.lock, [1, 2, 3]);
  });

  test("Non-mutable operations | isEmpty | isNotEmpty", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    expect(modifiableListView.isEmpty, isFalse);
    expect(modifiableListView.isNotEmpty, isTrue);
  });

  test("Mutations are allowed | ModifiableListView.[]= operator", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    modifiableListView[2] = 4;
    expect(modifiableListView.length, 3);
    expect(modifiableListView[2], 4);
  });

  test("Mutations are allowed | ModifiableListView.length setter", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    modifiableListView.length = 2;
    expect(modifiableListView.length, 2);

    modifiableListView.length = 4;
    expect(modifiableListView.length, 4);
  });

  test("Mutations are allowed | ModifiableListView.add()", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    modifiableListView.add(4);
    expect(modifiableListView.length, 4);
    expect(modifiableListView.last, 4);
  });

  test("Mutations are allowed | ModifiableListView.addAll()", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    modifiableListView.addAll([4, 5]);
    expect(modifiableListView.length, 5);
    expect(modifiableListView[3], 4);
    expect(modifiableListView[4], 5);
  });

  test("Mutations are allowed | ModifiableListView.remove()", () {
    final IList<int> iList = [1, 2, 3].lock;
    final ModifiableListView<int> modifiableListView = ModifiableListView(iList);
    modifiableListView.remove(2);
    expect(modifiableListView.length, 2);
    expect(modifiableListView[0], 1);
    expect(modifiableListView[1], 3);
  });
}
