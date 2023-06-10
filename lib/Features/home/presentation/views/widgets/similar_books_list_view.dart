import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  final List<BookEntity> books;

  const SimilarBooksListview({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: CustomBookImage(
                imageUrl: books[index].image ?? '',
              ),
            );
          }),
    );
  }
}
