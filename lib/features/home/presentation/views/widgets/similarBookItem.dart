import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouCanAlsoLikeItem extends StatelessWidget {
  const YouCanAlsoLikeItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4, right: 8, left: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Get.to(BookDetailsView(bookModel: bookModel),
              transition: Transition.fade);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
