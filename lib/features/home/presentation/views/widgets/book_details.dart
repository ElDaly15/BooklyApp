import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_container_for_perview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/mainDetailsItem.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/nullContainerPreview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similarBookListView.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Expanded(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainDetailesItem(
                  bookModel: bookModel,
                ),
                bookModel.volumeInfo?.previewLink == null
                    ? NullPreviewContainer()
                    : CustomContainerForPriceAndPreview(
                        bookModel: bookModel,
                      ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'You Can Also Like',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                YouCanAlsoLikeListView(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
