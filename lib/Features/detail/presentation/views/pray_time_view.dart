import 'package:Qurane_app/Features/detail/presentation/manager/pray_time_cubit/pray_time_cubit.dart';
import 'package:Qurane_app/Features/detail/widgets/custom_pray_text.dart';
import 'package:Qurane_app/Features/detail/widgets/custom_pray_time_stack.dart';
import 'package:Qurane_app/core/utlity/custom_error_widget.dart';
import 'package:Qurane_app/core/utlity/custom_loading_indcaitor.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayTimeView extends StatelessWidget {
  const PrayTimeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final halfScreenHeight = screenHeight * 0.7;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Add the desired navigation action here
          },
        ),
      ),
      backgroundColor: const Color(0xff180B37),
      body: SizedBox(
        height: halfScreenHeight,
        child: Column(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: CustomPrayTimeStck(),
              ),
            ),
            BlocBuilder<PrayTimeCubit, PrayTimeState>(
              builder: (context, state) {
                if (state is PrayTimeSucess) {
                  final timings = state.prayerTimes.data[0].timings;
                  return Column(
                    children: [
                      CustomPrayTimeText(
                        imge: Utlity.imageCloudComputing,
                        pray: "الفجر",
                        prayTime: timings.fajr,
                      ),
                      const SizedBox(height: 8),
                      CustomPrayTimeText(
                        imge: Utlity.imageCloudyNight,
                        pray: "الشروق",
                        prayTime: timings.sunrise,
                      ),
                      const SizedBox(height: 8),
                      CustomPrayTimeText(
                        imge: Utlity.imageSunrise,
                        pray: "الضهر",
                        prayTime: timings.dhuhr,
                      ),
                      const SizedBox(height: 8),
                      CustomPrayTimeText(
                        imge: Utlity.imageSunrise,
                        pray: "العصر",
                        prayTime: timings.asr,
                      ),
                      const SizedBox(height: 8),
                      CustomPrayTimeText(
                        imge: Utlity.imageCloudComputing,
                        pray: "المغرب",
                        prayTime: timings.maghrib,
                      ),
                      const SizedBox(height: 8),
                      CustomPrayTimeText(
                        imge: Utlity.imageCloudyNight,
                        pray: "العشاء",
                        prayTime: timings.isha,
                      ),
                    ],
                  );
                } else if (state is PrayTimeFailure) {
                  return CoustemErrorWidget(
                    errorMessage: state.errorMessage,
                  );
                }
                // Add a default return statement
                else {
                  return const CustomLoadingIndcaitor();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
