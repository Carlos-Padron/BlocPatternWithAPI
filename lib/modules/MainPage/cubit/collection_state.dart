part of 'collection_cubit.dart';

@immutable
abstract class CollectionState {
  const CollectionState();
}

class CollectionInitial extends CollectionState {
  const CollectionInitial();
}

class CollectionFetching extends CollectionState {
  const CollectionFetching();
}

class CollectionFetched extends CollectionState {
  final List<Book> books;
  const CollectionFetched(
    this.books,
  );
}

class CollectionError extends CollectionState {
  final String errorMsg;
  const CollectionError(this.errorMsg);
}
