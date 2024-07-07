import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return Text('No Data');
          } else {
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
          }
        } else if (state is SearchFail) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errorMsg)));
        } else if (state is SearchInitial) {
          return SliverToBoxAdapter(
              child: Center(
                  child: Text(
            'Start Search Now ...',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )));
        } else {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
