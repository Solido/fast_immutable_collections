import 'package:meta/meta.dart';

import '../../fast_immutable_collections.dart';
import "../base/hash.dart";

/// An *immutable* list of only 2 items.
@immutable
class IListOf2<T> {
  final T first, last;

  const IListOf2(this.first, this.last);

  @override
  String toString() => "[$first, $last]";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IListOf2 &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          last == other.last;

  @override
  int get hashCode => hashObj2(first, last);
}

/// Dedicated Indexation Zip
// TODO required non-function type alias since dart 2.13
// typedef IndexedZip<T> = Zip<int, T>;

/// Resulting composition of multiple sources like indexes or other Iterables.
/// Adapted from Tuple package
class ITuple2<T1, T2> {
  /// Returns the first item of the tuple
  final T1 first;

  /// Returns the second item of the tuple
  final T2 second;

  /// Creates a new tuple value with the specified items.
  const ITuple2(this.first, this.second);

  /// Create a new tuple value with the specified Iterable [items].
  factory ITuple2.fromList(Iterable items) {
    if (items.length != 2) throw ArgumentError('items must have length 2');

    return ITuple2<T1, T2>(items.elementAt(0) as T1, items.elementAt(1) as T2);
  }

  /// Returns a tuple with the first item set to the specified value.
  ITuple2<T1, T2> withItem1(T1 v) => ITuple2<T1, T2>(v, second);

  /// Returns a tuple with the second item set to the specified value.
  ITuple2<T1, T2> withItem2(T2 v) => ITuple2<T1, T2>(first, v);

  /// Creates a [IList] containing the items of this [ITuple2].
  /// The elements are in item order.
  IList toList({bool growable = false}) => [first, second].lock;

  @override
  String toString() => '($first, $second)';

  @override
  bool operator ==(Object other) =>
      other is ITuple2 && other.first == first && other.second == second;

  @override
  int get hashCode => hash2(first.hashCode, second.hashCode);
}
