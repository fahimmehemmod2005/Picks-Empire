import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/input_field.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/features/profile/presentation/viewmodel/date_picker_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../app/widgets/my_scaffold.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../widgets/gender_list_tile.dart';
import '../widgets/widget_edit_profile.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  final _dateController = TextEditingController();
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizeBox.height20,
              WidgetHeader(title: "Profile", width: 100.w),
              WidgetEditProfile(),
              AppSizeBox.height20,
              InputField(
                maxLine: 1,
                topLabel: 'First Name',
                hintText: 'Enter your first name',
              ),
              AppSizeBox.height10,
              InputField(
                maxLine: 1,
                topLabel: 'Last Name',
                hintText: 'Enter your last name',
              ),
              AppSizeBox.height10,
              InputField(
                maxLine: 1,
                topLabel: 'Email',
                hintText: 'Enter your email',
              ),
              AppSizeBox.height10,

              Consumer<DatePickerViewModel>(
                builder: (context, provider, child) {
                  _dateController.text = provider.formattedDate;
                  return InputField(
                    controller: _dateController,
                    maxLine: 1,
                    keyboardType: TextInputType.datetime,
                    topLabel: 'Date of Birth',
                    hintText: 'day-month-year',
                    icon: Icons.calendar_month_outlined,
                    onSuffixTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2005),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        _dateController.text =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      }
                    },
                  );
                },
              ),
              AppSizeBox.height10,
              InputField(
                maxLine: 1,
                topLabel: 'Location',
                hintText: 'Enter your location',
              ),
              AppSizeBox.height10,
              Text(
                'Gender',
                style: AppTextStyles.size14w600(color: AppColor.label),
              ),
              AppSizeBox.height10,
              GenderListTile(),
              AppSizeBox.height30,
              MainButton(
                label: 'Save changes',
                onTap: (){
                  Navigator.pushReplacementNamed(context, RouteName.mainScreen);
                },
              ),
              AppSizeBox.height10,
            ],
          ),
        ),
      ),
    );
  }
}
