import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import '../../manger/fetch_featured_books_cubit/fetch_featured_books_states.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessFeaturedBooksState) {
          return FeaturedBooksListView(
            books: state.books,
          );
        } else if (state is ErrorFeaturedBooksState) {
          return Center(
            child: Text(
              state.errorMessage,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
