import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

import 'fetch_newest_books_states.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(
    this.fetchNewestBooksUseCase,
  ) : super(
          InitialNewestBooksState(),
        );

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    emit(LoadingNewestBooksState());
    var result = await fetchNewestBooksUseCase.execute(
      pageNumber,
    );
    result.fold(
      (error) {
        emit(
          ErrorNewestBooksState(
            errorMessage: error.failureMessage,
          ),
        );
      },
      (books) {
        emit(
          SuccessNewestBooksState(
            books: books,
          ),
        );
      },
    );
  }
}
