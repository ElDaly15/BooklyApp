part of 'book_cubit_cubit.dart';

sealed class BookCubitState extends Equatable {
  const BookCubitState();

  @override
  List<Object> get props => [];
}

final class BookCubitInitial extends BookCubitState {}

final class BookCubitLoading extends BookCubitState {}

final class BookCubitFail extends BookCubitState {
  final String errorMsg;

  BookCubitFail({required this.errorMsg});
}

final class BookCubitSuccess extends BookCubitState {
  final List<BookModel> books;

  BookCubitSuccess({required this.books});
}
