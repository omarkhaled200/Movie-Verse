import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View_model/Get%20Movie%20search/get_movie_search_cubit.dart';

class CustomSearchViewTextField extends StatelessWidget {
  CustomSearchViewTextField({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<GetMovieSearchCubit>(
            context,
          ).fetchSearchedBook(title: value);
        }
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<GetMovieSearchCubit>(
              context,
            ).fetchSearchedBook(title: controller.text);
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 18),
        ),
        hintText: 'Search',
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
