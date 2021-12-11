import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import '../my_company_provider.dart';

class RequestCard extends ConsumerWidget {
  final index;

  const RequestCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final requestsList = watch(requestsProvider);

    List<Tuple2> tuples = [
      Tuple2(
        Icons.directions_bike,
        StepState.indexed,
      ),
      Tuple2(
        Icons.directions_bus,
        StepState.editing,
      ),
      Tuple2(
        Icons.directions_railway,
        StepState.complete,
      ),
    ];

    String _getStepLabel(state) {
      switch (state) {
        case StepState.indexed: return 'IPO';
        case StepState.editing: return 'Soft';
        default: return 'Hard';
      }
    }

    String _getDate(stepNum) {
      switch (stepNum) {
        case 0: return DateFormat('dd.MM.yyyy').format(DateTime.now());
        case 1: return DateFormat('dd.MM.yyyy').format(requestsList.state[index]!.softEndDate);
        default: return DateFormat('dd.MM.yyyy').format(requestsList.state[index]!.hardEndDate);
      }
    }

    return SizedBox(
      height: 155,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        color: Color(0xfff1fae2),
        child: Center(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: requestsList.state[index]!.accumulatedSum < requestsList.state[index]!.softCap ? 0 : 1,
            physics: ClampingScrollPhysics(),
            steps: tuples
                .map((e) => Step(
                      state: StepState.values[tuples.indexOf(e)],
                      isActive: (requestsList.state[index]!.accumulatedSum < requestsList.state[index]!.softCap ? 0 : 1) == tuples.indexOf(e),
                      title: Text(_getStepLabel(StepState.values[tuples.indexOf(e)])),
                      subtitle: Text(
                        _getDate(tuples.indexOf(e)),
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Цель: ${requestsList.state[index]!.goal}", style: TextStyle(fontSize: 14),),
                          Text("Всего собрано: \$${requestsList.state[index]!.accumulatedSum}", style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ))
                .toList(),
            controlsBuilder: (BuildContext context,
                {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
