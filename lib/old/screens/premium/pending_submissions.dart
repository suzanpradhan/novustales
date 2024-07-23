import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/outlined_button.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';

import '../../network/api_response.dart';
import 'cusWidgets/circular_loading.dart';
import 'models/submission_model.dart';
import 'repositories/premium_repo.dart';
import 'utils/injection.dart';
import 'widget/story_submission.dart';
import 'widget/top_notification_bar.dart';

class PendingSubmissions extends StatefulWidget {
  final WarModel war;
  const PendingSubmissions({super.key, required this.war});

  @override
  State<PendingSubmissions> createState() => _PendingSubmissionsState();
}

class _PendingSubmissionsState extends State<PendingSubmissions> {
  late WarModel war;
  final premiumRepo = PremiumRepo();
  List<SubmissionModel> submissions = [];
  bool submissionLoading = true;

  @override
  void initState() {
    super.initState();

    war = widget.war;
    getPendingSubmissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNotificationBar(showBackButton: false),
            Expanded(
              child: submissionLoading
                  ? Loading()
                  : submissions.isEmpty
                      ? Center(
                          child: Text(
                            "No stories available",
                            style: TextStyle(color: white),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(
                            top: 30.pH,
                            left: 20.pW,
                            right: 20.pW,
                            bottom: 20.pH,
                          ),
                          child: Wrap(
                            spacing: 20.pW,
                            runSpacing: 20.pW,
                            children: List.generate(
                              submissions.length,
                              (index) {
                                final submission = submissions[index];
                                bool accepting = false;

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    StorySubmission(submission: submission),
                                    Container(
                                      width: (sCon.width - 80.pW) / 3,
                                      margin: EdgeInsets.only(top: 5),
                                      child: StatefulBuilder(
                                        builder: (context, newState) {
                                          if (accepting) return Loading();
                                          return CusOutB(
                                            onPressed: () async {
                                              newState(() => accepting = true);
                                              await acceptSubmission(
                                                  submission.id.toString());
                                              newState(() => accepting = false);
                                            },
                                            text: "Accept",
                                            backgroundColor: storyBrown,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  getPendingSubmissions() async {
    final res = await premiumRepo.getPendingSubmissions("${war.id}");
    if (res.status == Status.COMPLETED) submissions = res.data!;

    setState(() => submissionLoading = false);
  }

  acceptSubmission(String submissionId) async {
    final res = await premiumRepo.acceptStorySub(submissionId);
    if (res.status != Status.COMPLETED) return;

    final res1 = await premiumRepo.getPendingSubmissions("${war.id}");
    if (res1.status == Status.COMPLETED) {
      final list = res1.data!;
      if (list.isEmpty && context.mounted) return Navigator.pop(context);
      setState(() => submissions = list);
    }
  }
}
