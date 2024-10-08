import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VerticalLoader extends StatelessWidget {
  int? count;
  VerticalLoader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: count,
              physics: const ScrollPhysics(),
              itemBuilder: (context, i) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 100.0,
                    width: double.infinity,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
