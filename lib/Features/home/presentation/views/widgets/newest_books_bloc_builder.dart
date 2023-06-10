import 'package:bookly/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view.dart';

class NewestBooksBlocBuilder extends StatelessWidget {
  const NewestBooksBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessNewestBooksState) {
          return BestSellerListView(
            books: state.books,
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
