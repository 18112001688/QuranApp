import 'package:Qurane_app/Features/detail/presentation/manager/ahdes_cubit/ahdes_cubit.dart';
import 'package:Qurane_app/Features/detail/widgets/custom_hdes_item.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/custom_error_widget.dart';
import 'package:Qurane_app/core/utlity/custom_loading_indcaitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AhdesView extends StatelessWidget {
  const AhdesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? primaryColor
              : const Color(0xff180B37),
          title: const Text(
            'الأحاديث',
            style: TextStyle(
              fontFamily: 'me_quran',
              fontSize: 20,
            ),
          ),
        ),
        body: BlocBuilder<AhdesCubit, AhdesState>(
          builder: (context, state) {
            if (state is AhdesSuccess) {
              final hdes = state.hdesModel.items;
              return Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                    itemCount: hdes.length,
                    itemBuilder: (context, index) {
                      return CustomHdesItem(
                        text: hdes[index].arab,
                      );
                    }),
              );
            } else if (state is AhdesFailure) {
              return CoustemErrorWidget(errorMessage: state.errorMessage);
            } else {
              return const CustomLoadingIndcaitor();
            }
          },
        ));
  }
}
