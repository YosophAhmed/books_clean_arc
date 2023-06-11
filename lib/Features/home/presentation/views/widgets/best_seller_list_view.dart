import 'package:bookly/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  final List<BookEntity> books;

  const BestSellerListView({
    super.key,
    required this.books,
  });

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.9 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.books.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: BookListViewItem(
            book: widget.books[index],
          ),
        );
      },
    );
  }
}
