import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/presentation/manger/fetch_featured_books_cubit/fetch_featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit()
      : super(
          InitialBooksStates(),
        );
}
