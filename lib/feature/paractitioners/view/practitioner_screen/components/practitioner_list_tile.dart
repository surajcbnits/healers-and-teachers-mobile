import 'package:flutter/material.dart';
import 'package:healersandteachers/utils/toCapitalized.dart';

import '../../../../../constant/app_color.dart';
import '../../../../../helper/text_style.dart';
import '../../../../../utils/location.dart';
import '../../../../../widgets/chip.dart';
import '../../../../../widgets/icon_text_widget.dart';
import '../../../model/pracitioners_model.dart';

class PractitionerListCard extends StatefulWidget {
  const PractitionerListCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final MemberDetails data;

  @override
  State<PractitionerListCard> createState() => _PractitionerListCardState();
}

class _PractitionerListCardState extends State<PractitionerListCard> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColor.primaryColor.withOpacity(.12),
          radius: 45,
          backgroundImage: NetworkImage(widget.data.image!),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.data.firstName!} ${widget.data.lastName!}",
                style: TextStyleHelper.t18b700(),
              ),
              Text(
                widget.data.title!,
                style: TextStyleHelper.t14b600().copyWith(
                  // height: 1.2,
                  color: AppColor.grey,
                ),
              ),
              Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        widget.data.wellnessKeywords!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: CustomChip(
                              title:
                                  widget.data.wellnessKeywords![index].name!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     ...List.generate(
              //       data.wellnessKeywords!.length,
              //       (index) => Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 2.5),
              //         child: CustomChip(
              //             title: data.wellnessKeywords![index].name!),
              //       ),
              //     ),
              //   ],
              // ),
              IconTextWidget(
                isOnline: false,
                title: locationString(
                  city: widget.data.city!,
                  state: widget.data.state!,
                  country: widget.data.country!,
                ),
                color: AppColor.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
