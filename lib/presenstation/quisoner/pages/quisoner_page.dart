import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../bloc/bloc/quisoner_bloc.dart';

class QuisonerPage extends StatefulWidget {
  const QuisonerPage({Key? key}) : super(key: key);

  @override
  State<QuisonerPage> createState() => _QuisonerPageState();
}

class _QuisonerPageState extends State<QuisonerPage> {
  Map<String, dynamic> selectedOptions = {};

  List questionlist = [];

  @override
  void initState() {
    super.initState();
    context.read<QuisonerBloc>().add(const QuisonerEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuesioner'),
      ),
      body: BlocBuilder<QuisonerBloc, QuisonerState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (message) {
              return Center(
                child: Text(message),
              );
            },
            success: (datum) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: datum.length,
                      itemBuilder: (context, index) {
                        final questionData = datum[index];
                        return Card(
                          margin: const EdgeInsets.all(16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  questionData.question,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                const SizedBox(height: 16.0),
                                Column(
                                  children: List.generate(
                                    questionData.option.length,
                                    (optionIndex) {
                                      final option =
                                          questionData.option[optionIndex];
                                      return RadioListTile<int?>(
                                        title: Text(option.nameOption),
                                        value: optionIndex,
                                        groupValue: selectedOptions[
                                            questionData.idQuestion],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOptions[questionData
                                                .idQuestion] = value!;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Format selectedOptions into the desired output
                      List<Map<String, String>> result =
                          selectedOptions.entries.map((entry) {
                        return {
                          "id_question": entry.key,
                          "id_option": datum.first.option.first.idOption,
                        };
                      }).toList();
                      print(result);
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
