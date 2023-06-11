import 'package:bookly/Features/home/presentation/views/widgets/featured_books_loading_indicator.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import '../../manger/fetch_newest_books_cubit/fetch_newest_books_states.dart';

class SimilarBooksBlocBuilder extends StatelessWidget {
  const SimilarBooksBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessNewestBooksState) {
          return SimilarBooksListview(
            books: state.books,
          );
        } else if (state is ErrorNewestBooksState) {
          return Center(
            child: Text(
              state.errorMessage,
            ),
          );
        } else {
          return const FeaturedBooksLoadingIndicator();
        }
      },
    );
  }
}
