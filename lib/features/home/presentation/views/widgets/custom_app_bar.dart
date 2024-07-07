import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 20, top: 50),
      child: Row(
        children: [
          Image.asset(
            'assets/images/Logo.png',
            height: 20,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(SearchView(),
                  duration: Duration(milliseconds: 250),
                  transition: Transition.fadeIn);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
