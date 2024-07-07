import 'package:bookly_app/core/widgets/progress_indecator.dart';
import 'package:bookly_app/features/home/presentation/views/manager/book_cubit/book_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/manager/featureBooks/feuture_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similarBookItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YouCanAlsoLikeListView extends StatelessWidget {
  const YouCanAlsoLikeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeutureBooksCubit, FeutureBooksState>(
      builder: (context, state) {
        if (state is FeutureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return YouCanAlsoLikeItem(
                      bookModel: state.books[index],
                    );
                  }),
            ),
          );
        } else if (state is FeutureBooksFail) {
          return ErrorWidget(state.errorMsg);
        } else {
          return ProgressIndecator();
        }
      },
    );
  }
}
