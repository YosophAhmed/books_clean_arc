import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    return getBooksList(
      data: data,
    );
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming',
    );
    return getBooksList(
      data: data,
    );
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