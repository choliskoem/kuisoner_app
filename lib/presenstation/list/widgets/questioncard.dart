import 'package:flutter/material.dart';
import 'package:kusioner_ung/core/constants/colors.dart';

import '../../../data/models/response/question_response_model.dart';

class QuestionCard extends StatelessWidget {
  final DataCategory question;
  final String? selectedOption;
  final ValueChanged<String?> onOptionSelected;

  const QuestionCard({
    Key? key, // Added missing Key parameter
    required this.question,
    required this.selectedOption,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Text(
                question.question,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: (question.option)
                  .map(
                    (option) => RadioListTile<String?>(
                      activeColor: AppColors.primary,
                      title: Text(option.nameOption),
                      value: option.idOption,
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        onOptionSelected(value);
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
