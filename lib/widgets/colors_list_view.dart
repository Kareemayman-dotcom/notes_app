import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import 'color_item.dart';



class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 2.w,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).currentColor =
                  kColorsList[index];
              setState(() {});
            },
            child: ColorItem(
              color: kColorsList[index],
              isAcive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
