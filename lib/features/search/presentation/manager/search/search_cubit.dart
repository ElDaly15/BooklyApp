import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repo/home_repo.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;

  GetBooks({required String searchedBook}) async {
    emit(SearchLoading());
    var data = await searchRepo.SearchedBooks(q: searchedBook);
    data.fold((left) {
      emit(SearchFail(errorMsg: 'No Search Data'));
    }, (right) {
      emit(SearchSuccess(books: right));
    });
  }
}
