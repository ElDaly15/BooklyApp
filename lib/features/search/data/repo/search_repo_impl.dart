import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> SearchedBooks(
      {required String q}) async {
    try {
      var request = await ApiService().get(
          url:
              'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=$q');
      List<BookModel> books = [];
      for (var element in request['items']) {
        books.add(BookModel.fromJson(element));
      }

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
