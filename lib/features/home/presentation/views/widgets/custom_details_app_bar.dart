import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.to(HomeView(),
                  duration: Duration(milliseconds: 250),
                  transition: Transition.downToUp);
            },
            icon: Icon(
              Icons.close,
              size: 34,
              color: Colors.white,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartShopping,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
