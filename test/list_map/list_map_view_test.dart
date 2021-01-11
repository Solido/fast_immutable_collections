import "dart:math";

import "package:test/test.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";

void main() {
  /////////////////////////////////////////////////////////////////////////////

  test("ordering", () {
    // 1) Regular usage
    ListMapView<String, int> listMapView =
        ListMapView({"a": 1, "c": 3, "b": 2, "d": 4, "e": 5, "f": 6});

    expect(listMapView.entryAt(0).key, "a");
    expect(listMapView.entryAt(0).value, 1);
    expect(listMapView.entryAt(2).key, "b");
    expect(listMapView.entryAt(2).value, 2);
    expect(listMapView.entryAt(1).key, "c");
    expect(listMapView.entryAt(1).value, 3);
    expect(listMapView.entryAt(3).key, "d");
    expect(listMapView.entryAt(3).value, 4);
    expect(listMapView.entryAt(4).key, "e");
    expect(listMapView.entryAt(4).value, 5);
    expect(listMapView.entryAt(5).key, "f");
    expect(listMapView.entryAt(5).value, 6);

    // 2) Nulls and other edge cases
    listMapView = ListMapView(null);
    expect(listMapView, {});
    expect(listMapView.length, 0);

    listMapView = ListMapView({});
    expect(listMapView, {});
    expect(listMapView.length, 0);
  }, skip: true);

  /////////////////////////////////////////////////////////////////////////////

  test("[]=", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
//    view["a"] = 2;
//    expect(view, {}                           );
    expect(() => view["a"] = 2, throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("addAll", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.addAll({"a": 3, "d": 10}), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("addAll", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.addEntries([MapEntry("a", 3), MapEntry("d", 10)]), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("clear", () {
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.clear(), throwsUnsupportedError);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("containsValue", () {
    final ListMapView<String, int> listMapView = ListMapView({"a": 1, "b": 2, "c": 3});
    expect(listMapView.containsValue(1), isTrue);
    expect(listMapView.containsValue(100), isFalse);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("entry", () {
    final ListMapView<String, int> imap = ListMapView({"a": 1, "b": 2, "c": 3});

    expect(imap.entry("a").key, "a");
    expect(imap.entry("a").value, 1);

    expect(imap.entry("z").key, "z");
    expect(imap.entry("z").value, null);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("forEach", () {
    final ListMapView<String, int> listMapView =
        ListMapView({"a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6});
    int result = 100;
    listMapView.forEach((String k, int v) => result *= 1 + v);
    expect(result, 504000);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("putIfAbsent", () {
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.putIfAbsent("a", () => 10), throwsUnsupportedError);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("isEmpty | isNotEmpty", () {
    expect(ListMapView({}).isEmpty, isTrue);
    expect(ListMapView<String, int>({}).isEmpty, isTrue);
    expect(ListMapView({"a": 1}).isEmpty, isFalse);

    expect(ListMapView({}).isNotEmpty, isFalse);
    expect(ListMapView<String, int>({}).isNotEmpty, isFalse);
    expect(ListMapView({"a": 1}).isNotEmpty, isTrue);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("map", () {
    final ListMap<String, int> listMapView =
        ListMapView({"a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6});
    final Map<String, int> mapped =
        listMapView.map<String, int>((String k, int v) => MapEntry(k, v + 1));
    expect(mapped, {"a": 2, "b": 3, "c": 4, "d": 5, "e": 6, "f": 7});
  });

  /////////////////////////////////////////////////////////////////////////////

  test("remove", () {
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.remove("a"), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("removeWhere", () {
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.removeWhere((String key, int value) => key == "a"), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("update", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.update("a", (int value) => 2 * value), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("updateAll", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.updateAll((String key, int value) => 2 * value), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("shuffle", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.shuffle(Random(0)), throwsUnsupportedError);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("entryAt", () {
    final ListMapView<String, int> listMapView =
        ListMapView({"a": 1, "c": 3, "b": 2, "d": 4, "e": 5, "f": 6});

    expect(listMapView.entryAt(0).key, "a");
    expect(listMapView.entryAt(0).value, 1);
    expect(listMapView.entryAt(2).key, "b");
    expect(listMapView.entryAt(2).value, 2);
    expect(listMapView.entryAt(1).key, "c");
    expect(listMapView.entryAt(1).value, 3);
    expect(listMapView.entryAt(3).key, "d");
    expect(listMapView.entryAt(3).value, 4);
    expect(listMapView.entryAt(4).key, "e");
    expect(listMapView.entryAt(4).value, 5);
    expect(listMapView.entryAt(5).key, "f");
    expect(listMapView.entryAt(5).value, 6);

    expect(() => listMapView.entryAt(6), throwsRangeError);
    expect(() => listMapView.entryAt(-1), throwsRangeError);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("keyAt", () {
    final ListMapView<String, int> listMapView =
        ListMapView({"a": 1, "c": 3, "b": 2, "d": 4, "e": 5, "f": 6});

    expect(listMapView.keyAt(0), "a");
    expect(listMapView.keyAt(2), "b");
    expect(listMapView.keyAt(1), "c");
    expect(listMapView.keyAt(3), "d");
    expect(listMapView.keyAt(4), "e");
    expect(listMapView.keyAt(5), "f");

    expect(() => listMapView.keyAt(6), throwsRangeError);
    expect(() => listMapView.keyAt(-1), throwsRangeError);
  });

  //////////////////////////////////////////////////////////////////////////////

  test("valueAt", () {
    final ListMapView<String, int> listMapView =
        ListMapView({"a": 1, "c": 3, "b": 2, "d": 4, "e": 5, "f": 6});

    expect(listMapView.valueAt(0), 1);
    expect(listMapView.valueAt(2), 2);
    expect(listMapView.valueAt(1), 3);
    expect(listMapView.valueAt(3), 4);
    expect(listMapView.valueAt(4), 5);
    expect(listMapView.valueAt(5), 6);

    expect(() => listMapView.valueAt(6), throwsRangeError);
    expect(() => listMapView.valueAt(-1), throwsRangeError);
  });

  /////////////////////////////////////////////////////////////////////////////

  test("sort", () {
    // TODO: Specify
    final ListMapView<String, int> view = ListMapView({"b": 1, "a": 2, "c": 10});
    expect(() => view.sort(), throwsUnsupportedError);
  });

  /////////////////////////////////////////////////////////////////////////////
}
