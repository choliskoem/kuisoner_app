import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kusioner_ung/core/constants/colors.dart';

import 'package:kusioner_ung/data/models/response/question_response_model.dart';

import '../bloc/list/list_bloc.dart';
import '../widgets/questioncard.dart';


class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final PageController _pageController = PageController();
  Map<int, Map<int, String?>> selectedOptions = {};
  List<Datum> data = [];

  @override
  void initState() {
    super.initState();

    context.read<ListBloc>().add(const ListEvent.fetch());
  }

  bool isNextButtonActive(int categoryIndex) {
    final List<DataCategory> dataCategory =
        data.first.category[categoryIndex].dataCategory;
    for (int j = 0; j < dataCategory.length; j++) {
      final int pageIndex = categoryIndex * dataCategory.length + j;
      if (selectedOptions[categoryIndex] == null ||
          selectedOptions[categoryIndex]![pageIndex] == null) {
        return false;
      }
    }
    return true;
  }

  bool areAllQuestionsAnswered() {
    for (int i = 0; i < data.first.category.length; i++) {
      if (!isNextButtonActive(i)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('List Quis'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () => Container(),
            success: (responseData) {
              data = responseData; // Assigning the fetched data
              return PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.first.category.length,
                itemBuilder: (context, categoryIndex) {
                  final List<DataCategory> dataCategory =
                      data.first.category[categoryIndex].dataCategory;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 36, left: 26, bottom: 22),
                        child: Text(
                          data.first.category[categoryIndex].nameCategory,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: dataCategory.length,
                          itemBuilder: (context, questionIndex) {
                            final int pageIndex =
                                categoryIndex * dataCategory.length +
                                    questionIndex;
                            return QuestionCard(
                              question: dataCategory[questionIndex],
                              selectedOption: selectedOptions[categoryIndex]
                                  ?[pageIndex],
                              onOptionSelected: (String? selectedOptionId) {
                                setState(() {
                                  if (selectedOptions[categoryIndex] == null) {
                                    selectedOptions[categoryIndex] = {};
                                  }
                                  selectedOptions[categoryIndex]![pageIndex] =
                                      selectedOptionId;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                if (_pageController.page! > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_circle_left_outlined,
                      color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    'Back',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                if (isNextButtonActive(_pageController.page!.toInt())) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
                // else if (_pageController.page ==
                //         data.first.category!.first.dataCategory!.length - 1 &&
                //     areAllQuestionsAnswered()) {
                //   // saveSelectedOptionsToDatabase();
                //   // Navigator.push(
                //   //   context,
                //   //   MaterialPageRoute(builder: (context) => FinalPage()),
                //   // );
                // }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Next',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_circle_right_outlined,
                      color: Colors.white),
                  // SvgPicture.asset(
                  //   "assets/icons/typcn_arrow-right-outline.svg",
                  //   height: 24,
                  //   width: 24,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
