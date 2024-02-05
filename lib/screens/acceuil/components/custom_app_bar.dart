import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../../../utils/snackbar.dart';
import '../../../widgets/small_padding.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        LocationWidget(),
        Spacer(),
        ProfileImage(
          url: 'https://i.imgur.com/uTjWuc8.jpg',
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        smallPaddingVertical,
        GestureDetector(
          onTap: () => showSnackBarBuildLater(context),
          child: Row(
            children: [
              Text(
                "Bilzen, Tanjungbalai",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              smallPaddingVertical,
              Icon(
                CupertinoIcons.chevron_down,
                color: Colors.white,
                size: 15.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSnackBarBuildLater(context),
      child: SizedBox(
        width: 45.sp,
        height: 45.sp,
        child: ClipRRect(
          borderRadius: kBorderRadius,
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
