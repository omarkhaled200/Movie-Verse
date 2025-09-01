import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchViewTextField extends StatelessWidget {
  CustomSearchViewTextField({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            // BlocProvider.of<SearchViewCubit>(context)
            //     .fetchSearchedBook(title:controller.text);
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
