import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../../../../core/utils/methods/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  Future<List<BookEntity>> fetchNewestBooks({
    int pageNumber = 0,
  });
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(
      data: data,
    );
    saveBooksData(
      books: books,
      boxName: kFeaturedBox,
    );
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(
      data: data,
    );
    saveBooksData(
      books: books,
      boxName: kNewestBox,
    );
    return books;
  }

  List<BookEntity> getBooksList({
    required Map<String, dynamic> data,
  }) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(
        BookModel.fromJson(bookMap),
      );
    }
    return books;
  }
}
