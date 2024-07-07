import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'book_cubit_state.dart';

class BookCubitCubit extends Cubit<BookCubitState> {
  BookCubitCubit(this.homeRepo) : super(BookCubitInitial());
  final HomeRepo homeRepo;
  Future<void> GetBooks() async {
    emit(BookCubitLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((left) {
      emit(BookCubitFail(errorMsg: left.errMessage));
    }, (right) {
      emit(BookCubitSuccess(books: right));
    });
  }
}
