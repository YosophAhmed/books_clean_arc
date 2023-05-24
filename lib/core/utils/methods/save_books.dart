import 'package:hive/hive.dart';

import '../../../Features/home/domain/entities/book_entity.dart';

void saveBooksData({
  required List<BookEntity> books,
  required String boxName,
}) {
  var box = Hive.box(boxName);
  box.addAll(books);
}