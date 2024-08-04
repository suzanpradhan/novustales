import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

class FeedInfo extends StatelessWidget {
  const FeedInfo({
    super.key,
    required this.avtarUrl,
    required this.userName,
    required this.feedTime,
    required this.feedDescription,
  });

  final String avtarUrl;
  final String userName;
  final String feedTime;
  final String feedDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.borderRadius),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(avtarUrl),
                ),
                SizedBox(
                  width: UIConstants.padding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      feedTime,
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: UIConstants.padding,
            ),
            Text(
              feedDescription,
              maxLines: 2,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.normal,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
