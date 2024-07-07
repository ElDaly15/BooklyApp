import 'package:bookly_app/core/widgets/progress_indecator.dart';
import 'package:bookly_app/features/home/presentation/views/manager/book_cubit/book_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfItems extends StatelessWidget {
  const ListViewOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubitCubit, BookCubitState>(
      builder: (context, state) {
        if (state is BookCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomListViewItem(
                    bookModel: state.books[index],
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                  ),
                );
              },
            ),
          );
        } else if (state is BookCubitFail) {
          return ErrorWidget(state.errorMsg);
        } else {
          return const ProgressIndecator();
        }
      },
    );
  }
}
