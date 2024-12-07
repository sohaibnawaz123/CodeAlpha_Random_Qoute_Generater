// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomqoutegeneraterapp/bloc/randomQoute_State.dart';
import 'package:randomqoutegeneraterapp/bloc/randomQoute_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../bloc/randomQoute_Event.dart';
import '../utils/appTheme.dart';
import '../utils/typography.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.white,
      appBar: AppBar(
        backgroundColor: Apptheme.primaryColor,
        title: Text(
          "Random Qoute Generater",
          style: appHeading(
              size: 24, color: Apptheme.white, weight: FontWeight.w600),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<RandomqouteBloc, RandomqouteState>(
              builder: (context, state) {
                return Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                      color: Apptheme.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black45,
                            blurRadius: 5)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Qoute',
                          style: appHeading(size: 32, color: Apptheme.white),
                        ),
                        Text(
                          "\"${state.qoute}\"",
                          style: appHeading(size: 24, color: Apptheme.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () async {
                              await Share.share(state.qoute);
                            },
                            child: const Icon(
                              CupertinoIcons.arrowshape_turn_up_right_fill,
                              color: Apptheme.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                  maximumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Apptheme.primaryColor),
              onPressed: () {
                context.read<RandomqouteBloc>().add(GenerateQoute());
              },
              child: Text(
                'Generater'.toUpperCase(),
                style: appHeading(
                    size: 20, color: Apptheme.white, weight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
