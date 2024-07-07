import 'dart:ui';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            BookDetailsView(
              bookModel: bookModel,
            ),
            duration: Duration(milliseconds: 250));
      },
      child: SizedBox(
        height: 140,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: bookModel.volumeInfo?.imageLinks.thumbnail ??
                          'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                      errorWidget: (context, url, error) =>
                          Icon(Icons.image_not_supported),
                    )),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      bookModel.volumeInfo!.authors[0],
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      children: [
                        Text('Free',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amberAccent,
                            size: 18,
                          ),
                        ),
                        Text(
                          '${bookModel.volumeInfo?.averageRating ?? 0}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                            '(${bookModel.volumeInfo?.ratingsCount ?? 0})'
                                .toString(),
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
