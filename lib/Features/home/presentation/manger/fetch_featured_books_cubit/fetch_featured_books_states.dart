import '../../../domain/entities/book_entity.dart';

abstract class FeaturedBooksStates {}

class InitialBooksStates extends FeaturedBooksStates {}

class LoadingBooksStates extends FeaturedBooksStates {}

class SuccessBooksStates extends FeaturedBooksStates {
  final List<BookEntity> books;

  SuccessBooksStates({
    required this.books,
  });
}

class ErrorBooksStates extends FeaturedBooksStates {
  final String errorMessage;

  ErrorBooksStates({
    required this.errorMessage,
  });
}
