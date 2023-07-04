import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:sizer/sizer.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return EditNoteView();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Color(0xffFFCC80)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              textColor: Colors.black,
              contentPadding:
                  EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h, bottom: 1.h),
              // tileColor: Colors.yellow,
              title: Text(
                'Flutter Tips',
                style: TextStyle(
                  fontSize: 17.sp,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: .7.h),
                child: Text(
                  "build your dreams with Kareem Ayman",
                  style: TextStyle(
                      fontSize: 13.sp, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome.trash,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 4.w,
                bottom: 2.h,
              ),
              child: Text(
                '1/7/2023',
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
