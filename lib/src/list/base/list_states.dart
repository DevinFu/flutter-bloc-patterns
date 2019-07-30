import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListState extends Equatable {
  ListState([List props = const []]) : super(props);
}

class ListLoading extends ListState {
  @override
  String toString() => 'ListLoading';
}

class ListLoadedEmpty extends ListState {
  @override
  String toString() => 'ListLoadedEmpty';
}

class ListLoaded<T> extends ListState {
  final List<T> items;

  ListLoaded(this.items)
      : assert(items != null && items.isNotEmpty, 'List items cannot be empty'),
        super([items]);

  @override
  String toString() => 'ListLoaded: $items';
}

class ListRefreshing<T> extends ListState {
  final List<T> items;

  ListRefreshing([this.items = const []])
      : assert(items != null),
        super([items]);

  @override
  String toString() => 'ListRefreshing: $items';
}

class ListNotLoaded extends ListState {
  final Exception exception;

  ListNotLoaded(this.exception)
      : assert(exception != null),
        super([exception]);

  @override
  String toString() => 'ListNotLoaded: $exception';
}