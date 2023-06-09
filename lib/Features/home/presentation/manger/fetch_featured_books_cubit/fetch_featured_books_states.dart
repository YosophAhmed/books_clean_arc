import '../../../domain/entities/book_entity.dart';

abstract class FeaturedBooksStates {}

class InitialFeaturedBooksState extends FeaturedBooksStates {}

class LoadingFeaturedBooksState extends FeaturedBooksStates {}

class SuccessFeaturedBooksState extends FeaturedBooksStates {
  final List<BookEntity> books;

  SuccessFeaturedBooksState({
    required this.books,
  });
}

class ErrorFeaturedBooksState extends FeaturedBooksStates {
  final String errorMessage;

  ErrorFeaturedBooksState({
    required this.errorMessage,
  });
}
