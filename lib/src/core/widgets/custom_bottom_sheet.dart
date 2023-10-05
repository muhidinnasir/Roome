import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/roome/presentation/widgets/favorite_card.dart';

class RemoveFromFavBottomSheet {
  static void show({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const MyCustomBottomSheet(),
    );
  }
}

class MyCustomBottomSheet extends StatefulWidget {
  const MyCustomBottomSheet({
    super.key,
  });

  @override
  State<MyCustomBottomSheet> createState() => _MyCustomBottomSheetState();
}

class _MyCustomBottomSheetState extends State<MyCustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      showDragHandle: true,
      enableDrag: true,
      animationController: _animationController,
      onDragStart: (_) {
        _animationController.forward();
      },
      shape: RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.0.r),
        ),
      ),
      backgroundColor: Colors.white,
      dragHandleColor: AppColors.darkGrey.withOpacity(0.49),
      dragHandleSize: Size(50.w, 3.h),
      onClosing: () {
        Navigator.pop(context);
      },
      builder: (context) => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          right: 15.w,
          left: 15.w,
          bottom: 30.h,
        ),
        children: <Widget>[
          Text(
            'Remove from favorite?',
            style: AppTextStyles.appBarTextStyle.copyWith(
              color: Colors.black.withOpacity(0.71),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.046),
          const FavoriteCard(),
          SizedBox(height: SizeConfig.screenHeight! * 0.033),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyCustomButton(
                height: 50.h,
                width: 148.w,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                backgroundColor: AppColors.primaryColor.withOpacity(0.24),
                onPressed: () => Navigator.pop(context),
                hasPrefix: false,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.textStyle15.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              MyCustomButton(
                height: 50.h,
                width: 148.w,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                backgroundColor: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4.93.w),
                    blurRadius: 18.49.w,
                    color: AppColors.primaryColor.withOpacity(0.56),
                  ),
                ],
                onPressed: () {}, // TODO:
                hasPrefix: false,
                child: Center(
                  child: Text(
                    'Yes, remove',
                    style: AppTextStyles.textStyle15.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
