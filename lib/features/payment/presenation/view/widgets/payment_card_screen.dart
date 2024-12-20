import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/app_localization.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/utils/image_paths.dart';
import 'custom_drow_down_field.dart';
import 'custom_label.dart';
import 'custome_app_bar.dart';
import 'custom_text_field.dart';
import 'custom_button.dart';

class PaymentCardScreen extends StatelessWidget {
  static const String routeName = 'Payment2 Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        actionWidget: Text(
          AppLocalizations.of(context)!.translate('add'),
          style: TextStyle(
              fontFamily: "Robot",
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: ColorApp.white_color),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabel(
              title: AppLocalizations.of(context)!.translate('card'),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hint: AppLocalizations.of(context)!.translate('enter2'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30.h),
            CustomLabel(
              title: AppLocalizations.of(context)!.translate('Hol'),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hint: AppLocalizations.of(context)!.translate('nameCard'),
            ),
            SizedBox(height: 30.h),
            CustomLabel(
              title: AppLocalizations.of(context)!.translate('valid'),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: CustomDropdownField(
                    icon: Center(
                      child: Image.asset(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? ImagePaths.month2
                            : ImagePaths.month,
                        height: 61.h,
                        width: 317.w,
                      ),
                    ),
                    items: List.generate(12, (index) {
                      String month = (index + 1).toString().padLeft(2, '0');
                      return DropdownMenuItem(
                        value: month,
                        child: Text(month),
                      );
                    }),
                    hint: '',
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomDropdownField(
                    icon: Center(
                      child: Image.asset(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? ImagePaths.year2
                            : ImagePaths.year,
                        height: 61.h,
                        width: 317.w,
                      ),
                    ),
                    items: List.generate(10, (index) {
                      int year = DateTime.now().year + index;
                      return DropdownMenuItem(
                        value: year.toString(),
                        child: Text(year.toString()),
                      );
                    }),
                    hint: '',
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomTextField(
                    hint: 'CVV',
                    obscureText: true,
                    suffixIcon: Image.asset(ImagePaths.eye2),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: CustomButton(
                text: AppLocalizations.of(context)!.translate('confirm'),
                onPressed: () {
                  Navigator.pushNamed(context, "Success Screen");
                },
                w: 317.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
