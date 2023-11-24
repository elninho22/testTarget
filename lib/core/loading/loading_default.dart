import 'package:flutter/material.dart';

class LoadingDefault extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingDefault({Key? key, required this.child, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              color: Theme.of(context).shadowColor,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}