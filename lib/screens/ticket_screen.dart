import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/screens/ticket_view.dart';
import 'package:ticket_booking_app/utils/app_info_list.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/widgets/column_layout.dart';

import '../utils/app_styles.dart';
import '../widgets/layout_builder_widget.dart';
import '../widgets/ticket_tabs.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(20),
                vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(50)),
              Text(
                "Tickets ",
                style: Styles.headLineStyle1
                    .copyWith(fontSize: AppLayout.getWidth(35)),
              ),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              Gap(AppLayout.getHeight(25)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(
                  tickets: ticketList[0],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          firstText: "Flutter DB",
                          secondText: "Passenger",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnLayout(
                          firstText: "1234 5678910",
                          secondText: "passport",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilderWidget(
                      sections: 16,
                      isColor: true,
                      width: 5,
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          firstText: "1234 5678 9101",
                          secondText: "Number of E-ticket",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnLayout(
                          firstText: "789103",
                          secondText: "Booking code",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilderWidget(
                      sections: 16,
                      isColor: true,
                      width: 5,
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/visa.jpg",
                                  scale: 70,
                                ),
                                Text(
                                  " ***  1234",
                                  style: Styles.headLineStyle3,
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              "Payment method",
                              style: Styles.headLineStyle4,
                            ),
                          ],
                        ),
                        const AppColumnLayout(
                          firstText: '\$231.99',
                          secondText: 'Price',
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),

              //?bar code
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppLayout.getHeight(21)),
                    bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                  ),
                ),
                margin: EdgeInsets.only(
                  left: AppLayout.getHeight(15),
                  right: AppLayout.getHeight(15),
                ),
                padding: EdgeInsets.only(
                  top: AppLayout.getHeight(20),
                  bottom: AppLayout.getHeight(20),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https://github.com/neimael',
                      drawText: false,
                      color: Styles.textColor,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(
                  tickets: ticketList[0],
                ),
              ),
            ],
          ),
          Positioned(
            left: AppLayout.getHeight(25),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Styles.textColor,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: AppLayout.getHeight(25),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Styles.textColor,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
