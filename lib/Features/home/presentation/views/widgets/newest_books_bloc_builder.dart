import 'package:bookly/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view.dart';

class NewestBooksBlocBuilder extends StatefulWidget {
  const NewestBooksBlocBuilder({Key? key}) : super(key: key);

  @override
  State<NewestBooksBlocBuilder> createState() => _NewestBooksBlocBuilderState();
}

class _NewestBooksBlocBuilderState extends State<NewestBooksBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksStates>(
      listener: (BuildContext context, state) {
        if (state is SuccessNewestBooksState) {
          books.addAll(state.books);
        }
      },
      builder: (BuildContext context, state) {
        if (state is SuccessNewestBooksState ||
            state is PaginationLoadingNewestBooksState) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is ErrorNewestBooksState) {
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