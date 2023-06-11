import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manger/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import '../../manger/fetch_featured_books_cubit/fetch_featured_books_states.dart';
import 'error_widget.dart';
import 'featured_books_loading_indicator.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
      listener: (BuildContext context, state) {
        if (state is SuccessFeaturedBooksState) {
          books.addAll(state.books);
        }
        if (state is PaginationErrorFeaturedBooksState) {
          showCustomSnackBar(
            context: context,
            message: state.errorMessage,
          );
        }
      },
      builder: (BuildContext context, state) {
        if (state is SuccessFeaturedBooksState ||
            state is PaginationLoadingFeaturedBooksState ||
            state is PaginationErrorFeaturedBooksState) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is ErrorFeaturedBooksState) {
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
