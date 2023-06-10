import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookEntity> books;

  const BestSellerListView({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: BookListViewItem(
            book: books[index],
          ),
        );
      },
    );
  }
}
