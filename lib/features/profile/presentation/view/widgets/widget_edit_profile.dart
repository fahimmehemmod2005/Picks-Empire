import 'package:fdahunter/features/profile/presentation/viewmodel/edit_profile_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_images.dart';

class WidgetEditProfile extends StatelessWidget {
  const WidgetEditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 105,
        width: 125,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Stack(
          children: [
            Container(
            height: 120.0.h,
            width: 120.0.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.fahim),fit: BoxFit.cover)
            ),
          ),
            Positioned(
              top: 60,
              right: 10,
              child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: AppColor.main,
                    side: BorderSide(
                        color: Colors.white,
                        width: 5.0
                    )
                ),
                icon: Icon(Icons.edit_outlined,color: Colors.white,),
                onPressed: (){
                  showPickImageDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}