
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'localization.dart';

class LocalizationBlocProvider extends StatelessWidget {
  final Widget child;
  final LocalizationBloc bloc;

  const LocalizationBlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: child,
    );
  }

  static LocalizationBloc of(BuildContext context) {
    return BlocProvider.of<LocalizationBloc>(context, listen: false);
  }
}
