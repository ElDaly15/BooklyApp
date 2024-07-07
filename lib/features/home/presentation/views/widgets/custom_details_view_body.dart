import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_container_for_perview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/mainDetailsItem.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similarBookListView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDetailsViewBody extends StatelessWidget {
  const CustomDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomDetailsAppBar(),
        BookDetails(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
