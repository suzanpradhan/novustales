import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/spacer.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/widgets/app_bar_custom.dart';

class TaleDetailScreen extends StatefulWidget {
  final TaleEntity tale;
  const TaleDetailScreen({super.key, required this.tale});

  @override
  State<TaleDetailScreen> createState() => _TaleDetailScreenState();
}

class _TaleDetailScreenState extends State<TaleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarCustom(
        isTransparent: true,
        iconBgColor: AppColors.white.withOpacity(.3),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    widget.tale.thumbnail!,
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white.withOpacity(0), Colors.white])),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.tale.title ?? "--",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                if (widget.tale.categoryName != null)
                  Text(
                    widget.tale.categoryName!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                Gapper.vmGap(),
                if (widget.tale.createdBy != null)
                  Row(
                    children: [
                      if (widget.tale.createdBy!.avatar != null)
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.tale.createdBy!.avatar!),
                                  fit: BoxFit.cover)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: UIConstants.xminPadding),
                        child: Text((widget.tale.createdBy?.firstName != null &&
                                widget.tale.createdBy?.lastName != null)
                            ? "${widget.tale.createdBy!.firstName} ${widget.tale.createdBy?.lastName}"
                            : (widget.tale.createdBy?.nickName ?? "--")),
                      )
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
