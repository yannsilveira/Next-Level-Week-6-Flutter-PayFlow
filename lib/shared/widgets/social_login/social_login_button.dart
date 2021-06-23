

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButtom extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButtom({Key? key, required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.shape,
          borderRadius: BorderRadius.circular(8),
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.stroke
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.google),
                SizedBox(width: 60),
                Container(height: 40, width: 1, color: AppColors.stroke)
              ],
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Text("Entrar com Google", style: TextStyles.buttonGray),
            ))
          ],
        ),
      ),
    );
  }
}