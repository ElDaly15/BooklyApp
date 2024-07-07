part of 'feuture_books_cubit.dart';

sealed class FeutureBooksState extends Equatable {
  const FeutureBooksState();

  @override
  List<Object> get props => [];
}

final class FeutureBooksInitial extends FeutureBooksState {}

final class FeutureBooksLoading extends FeutureBooksState {}

final class FeutureBooksSuccess extends FeutureBooksState {
  final List<BookModel> books;

  FeutureBooksSuccess({required this.books});
}

final class FeutureBooksFail extends FeutureBooksState {
  final String errorMsg;

  FeutureBooksFail({required this.errorMsg});
}
