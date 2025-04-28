import 'package:chatapp/common/widget/upper_card.dart';
import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/add/domain/add_cubit.dart';
import 'package:chatapp/feature/add/domain/add_state.dart';

import 'package:chatapp/feature/add/widget/person_add_card.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:chatapp/responsive/app_screen_util.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:chatapp/shared/widget/loader/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddCubit>().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    final name = context.read<HomeCubit>().state.userProfile?.data?.name ?? '';
    return BlocBuilder<AddCubit, AddState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UpperCard(
                name: name,
              ),
              8.toVerticalSizedBox,
              if (state.apiStatus.isLoading) ...[
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 250.widthMultiplier,
                    ),
                    child: GradientCircularProgressIndicator())
              ] else ...[
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.addUserModel?.data?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        AppRoutes.appRouter.push(Routes.chatDetail,
                            extra: state.addUserModel?.data?[index].userid);
                      },
                      child: PersonAddCart(
                          name: state.addUserModel?.data?[index].name,
                          imagepath: "assets/image/virat.jpg",
                          tagLine: state.addUserModel?.data?[index].tagline,
                          userId: state.addUserModel?.data?[index].userid),
                    );
                  },
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
