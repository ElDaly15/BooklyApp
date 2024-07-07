import 'package:bookly_app/core/widgets/progress_indecator.dart';
import 'package:bookly_app/features/home/presentation/views/manager/featureBooks/feuture_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeutureBooksCubit, FeutureBooksState>(
      builder: (context, state) {
        if (state is FeutureBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return BestSellerListViewItem(
                  bookModel: state.books[index],
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is FeutureBooksFail) {
          return SliverToBoxAdapter(child: ErrorWidget(state.errorMsg));
        } else {
          return SliverToBoxAdapter(child: ProgressIndecator());
        }
      },
    );
  }
}
