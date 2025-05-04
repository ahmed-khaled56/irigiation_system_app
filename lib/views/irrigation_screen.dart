import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irrigiation_app/cubits/control_cubit/control_cubit.dart';
import 'package:irrigiation_app/cubits/control_cubit/control_states.dart';
import 'package:irrigiation_app/models/control_model.dart';

class IrrigationScreen extends StatefulWidget {
  const IrrigationScreen({super.key});

  @override
  State<IrrigationScreen> createState() => _IrrigationScreenState();
}

class _IrrigationScreenState extends State<IrrigationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StrartIrrigationCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<StrartIrrigationCubit, GetControlStates>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  title: Text('Start Irrigation'),
                ),
                body: Stack(
                  children: <Widget>[
                    // Background image
                    Positioned.fill(
                      child: Image.asset(
                        'lib/assets/images/water.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<StrartIrrigationCubit>(
                                context,
                              ).getControltSatus();
                              // var strartIrrigationCubit =
                              //     BlocProvider.of<StrartIrrigationCubit>(context);
                              // strartIrrigationCubit.getControltSatus();
                            },
                            child: Text('Start Irrigation'),
                          ),
                          BlocBuilder<StrartIrrigationCubit, GetControlStates>(
                            builder: (context, state) {
                              if (state is beforeStatrt) {
                                return const Text(
                                  'are you ready to start irrigation',
                                );
                              } else if (state
                                  is GetIrrigationSuccessfullSatate) {
                                return Text(
                                  state.controlModel.message,
                                ); //*** */
                              } else {
                                return const Center(
                                  child: Text(
                                    'opp there is an error',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
