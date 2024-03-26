import 'package:flutter/material.dart';
import 'package:grocer_ease/utils/constants.dart';

class SocialIconsRow extends StatelessWidget {
  final Function()? onAppleTap;
  final Function()? onGoogleTap;
  final Function()? onFacebookTap;

  const SocialIconsRow({
    super.key,
    required this.onAppleTap,
    required this.onGoogleTap,
    required this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: const OvalBorder()),
          child: Center(
            child: InkWell(
              onTap: onAppleTap,
              child: const Icon(
                Icons.apple,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: const OvalBorder()),
          child: Center(
            child: InkWell(
                onTap: onAppleTap, child: Center(child: Image.asset(google))),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: const OvalBorder()),
          child: Center(
            child: InkWell(
              onTap: onAppleTap,
              child: const Icon(
                Icons.facebook,
                size: 40,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
