import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/text_style.dart';
import 'package:healersandteachers/widgets/icon_text_widget.dart';

import '../../../constant/app_color.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String seenBefore = "no";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Your Appointment',
              style: TextStyleHelper.t24b700(),
            ),
            const SizedBox(height: 10),
            const IconTextWidget(
              iconData: Icons.access_time_filled_outlined,
              title: "Tuesday, 22 November 2022\n10:00 AM - 11:00 AM",
              color: AppColor.grey,
              isTextThin: true,
            ),
            const SizedBox(height: 10),
            const IconTextWidget(
              title: "Online",
              color: AppColor.grey,
              isTextThin: true,
            ),
            const Divider(
              thickness: 1,
              height: 40,
              color: AppColor.greyLight,
            ),
            Text("Have you seen amanda Harris Before?",
                style: TextStyleHelper.t16b600()),
            RadioListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColor.primaryColor,
              value: "no",
              groupValue: seenBefore,
              onChanged: (value) {
                setState(() {
                  seenBefore = value!;
                });
              },
              title: Text(
                "I’m New Client.",
                style: TextStyleHelper.t14b400(),
              ),
            ),
            RadioListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColor.primaryColor,
              value: "yes",
              groupValue: seenBefore,
              onChanged: (value) {
                setState(() {
                  seenBefore = value!;
                });
              },
              title: Text(
                "I’ve seen this practitioner before.",
                style: TextStyleHelper.t14b400(),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 30,
              color: AppColor.greyLight,
            ),
            Text("Payment Method", style: TextStyleHelper.t18b700()),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Meditation Call (30 Min)",
                    style: TextStyleHelper.t14b400()),
                const Spacer(),
                Text("\$ 30", style: TextStyleHelper.t14b600()),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Processing Frees", style: TextStyleHelper.t14b400()),
                const Spacer(),
                Text("\$ 0", style: TextStyleHelper.t14b600()),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text("Total", style: TextStyleHelper.t18b700()),
                const Spacer(),
                Text("\$ 30",
                    style: TextStyleHelper.t20b700()
                        .copyWith(color: AppColor.primaryColor)),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // primary: AppColor.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: Text(
                  "Confirm Booking",
                  style:
                      TextStyleHelper.t20b700().copyWith(color: Colors.white),
                ),
              ),
            ),
            Text(
              "The actual payment is to be made directly to the practitioner at the time of the appointment. Confirm booking here confirms your appointment with the practitioner at the date and time indicated. No payment is taken at this point.",
              style: TextStyleHelper.t16b600().copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
