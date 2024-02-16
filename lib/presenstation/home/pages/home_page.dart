import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/menu_button.dart';
import '../../../core/components/search_input.dart';
import '../../../core/components/spaces.dart';
import '../../../gen/assets.gen.dart';

import '../bloc/quisioner/quisioner_bloc.dart';
import '../widgets/home_appbar.dart';
import '../widgets/list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final indexValue = ValueNotifier(0);

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<QuisionerBloc>().add(const QuisionerEvent.fetch());
    super.initState();
  }

  void onCategoryTap(int index) {
    searchController.clear();
    indexValue.value = index;
    String category = 'all';
    switch (index) {
      case 0:
        category = 'all';
        break;
      case 1:
        category = 'Lecture';
        break;
      case 2:
        category = 'Student';
        break;
      case 3:
        category = 'Other';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HomeAppbar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    SearchInput(
                      controller: searchController,
                      onChanged: (value) {},
                    ),
                    const SpaceHeight(20.0),
                    ValueListenableBuilder(
                      valueListenable: indexValue,
                      builder: (context, value, _) => Row(
                        children: [
                          MenuButton(
                            iconPath: Assets.icons.tdesignTask,
                            label: 'All',
                            isActive: value == 0,
                            onPressed: () => onCategoryTap(0),
                          ),
                          const SpaceWidth(10.0),
                          MenuButton(
                            iconPath: Assets.icons.phChalkboardTeacher,
                            label: 'Lecture',
                            isActive: value == 1,
                            onPressed: () => onCategoryTap(1),
                          ),
                          const SpaceWidth(10.0),
                          MenuButton(
                            iconPath: Assets.icons.phStudent,
                            label: 'Student',
                            isActive: value == 2,
                            onPressed: () => onCategoryTap(2),
                          ),
                          const SpaceWidth(10.0),
                          MenuButton(
                            iconPath: Assets.icons.clarityUsersLine,
                            label: 'Other',
                            isActive: value == 3,
                            onPressed: () => onCategoryTap(3),
                          ),
                        ],
                      ),
                    ),
                    const SpaceHeight(10.0),
                    SizedBox(
                      height: 300,
                      child: BlocBuilder<QuisionerBloc, QuisionerState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loading: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            success: (data) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return ListCard(datums: data[index]);
                                },
                              );
                            },
                            error: (message) {
                              return Center(
                                child: Text(message),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
