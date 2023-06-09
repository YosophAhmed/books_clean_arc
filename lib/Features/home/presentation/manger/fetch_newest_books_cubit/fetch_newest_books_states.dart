import '../../../domain/entities/book_entity.dart';

abstract class NewestBooksStates {}

class InitialNewestBooksState extends NewestBooksStates {}

class LoadingNewestBooksState extends NewestBooksStates {}

class SuccessNewestBooksState extends NewestBooksStates {
  final List<BookEntity> books;

  SuccessNewestBooksState({
    required this.books,
  });
}

class ErrorNewestBooksState extends NewestBooksStates {
  final String errorMessage;

  ErrorNewestBooksState({
    required this.errorMessage,
  });
}
