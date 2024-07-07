import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feuture_books_state.dart';

class FeutureBooksCubit extends Cubit<FeutureBooksState> {
  FeutureBooksCubit(this.homeRepo) : super(FeutureBooksInitial());
  final HomeRepo homeRepo;

  GetFeatureBooks() async {
    var Request = await homeRepo.fetchFeutureBooks();
    Request.fold((left) {
      emit(FeutureBooksFail(errorMsg: left.errMessage));
    }, (right) {
      emit(FeutureBooksSuccess(books: right));
    });
  }
}
