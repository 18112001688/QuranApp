import 'package:Qurane_app/Features/detail/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:Qurane_app/Features/detail/widgets/custom_azkar_item.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/custom_error_widget.dart';
import 'package:Qurane_app/core/utlity/custom_loading_indcaitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? primaryColor
              : const Color(0xff180B37),
          title: const Text(
            'أذكار الصباح والمساء',
            style: TextStyle(fontFamily: 'me_quran'),
          ),
        ),
        body: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is AzkarSuccess) {
              final azkarItem = state.azkarData.azkarList;
              return ListView.builder(
                  itemCount: azkarItem.length,
                  itemBuilder: ((context, index) {
                    return CustomAzkarItem(
                        azkatItem: azkarItem[index].arabicText);
                  }));
            } else if (state is AzkarFailure) {
              return CoustemErrorWidget(errorMessage: state.errorMessage);
            } else {
              return const CustomLoadingIndcaitor();
            }
          },
        ));
  }
}
