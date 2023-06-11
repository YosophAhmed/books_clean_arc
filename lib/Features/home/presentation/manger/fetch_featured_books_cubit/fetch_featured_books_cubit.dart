import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/fetch_featured_books_cubit/fetch_featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(
    this.featuredBooksUseCase,
  ) : super(
          InitialFeaturedBooksState(),
        );

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    emit(LoadingFeaturedBooksState());
    var result = await featuredBooksUseCase.execute(
      pageNumber,
    );
    result.fold(
      (error) {
        emit(
          ErrorFeaturedBooksState(
            errorMessage: error.failureMessage,
          ),
        );
      },
      (books) {
        emit(
          SuccessFeaturedBooksState(
            books: books,
          ),
        );
      },
    );
  }
}