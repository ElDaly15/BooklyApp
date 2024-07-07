import 'package:bookly_app/features/home/data/models/repo/home_repo_implement.dart';
import 'package:bookly_app/features/home/presentation/views/manager/book_cubit/book_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/manager/featureBooks/feuture_books_cubit.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/features/search/presentation/manager/search/search_cubit.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookCubitCubit(HomeRepoImplement())..GetBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FeutureBooksCubit(HomeRepoImplement())..GetFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(SearchRepoImpl()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        home: SplashView(),
      ),
    );
  }
}
