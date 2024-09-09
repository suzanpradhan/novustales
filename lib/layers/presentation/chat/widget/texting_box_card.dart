import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat/message_entity.dart';
import '../../me/bloc/profile_bloc/get_profile_bloc.dart';

class TextingBox extends StatelessWidget {
  const TextingBox({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileBloc, GetProfileState>(
        builder: (context, state) {
      return state.whenOrNull(
            success: (userSession) {
              if (userSession.uuid == message.profileId) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(4.0), // No rounding on top-left
                            topRight: Radius.circular(
                                4.0), // Rounded top-right corner
                            bottomLeft: Radius.circular(
                                12.0), // Rounded bottom-left corner
                            bottomRight: Radius.circular(
                                6.0), // Rounded bottom-right corner
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10.0),
                          child: Text(
                            message.content ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(50),
                    //   child: SizedBox(
                    //     width: 45,
                    //     height: 45,
                    //     child: Image.asset(
                    //       listData.imagePath!,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),

                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(4.0), // No rounding on top-left
                            topRight: Radius.circular(
                                6.0), // Rounded top-right corner
                            bottomLeft: Radius.circular(
                                6.0), // Rounded bottom-left corner
                            bottomRight: Radius.circular(
                                12.0), // Rounded bottom-right corner
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10.0),
                          child: Text(
                            message.content ?? "",
                            style: Theme.of(context).textTheme.bodySmall!,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                );
              }
            },
          ) ??
          const SizedBox();
    });
  }
}
