import 'package:flutter/material.dart';

class BuildBody extends StatefulWidget {
  final BuildContext context;

  const BuildBody({super.key, required this.context});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        child: Column(
          // children: banks.map((bank) => BuildBankItem(context, bank)).toList(),
        ),
      ),
    );
  }
}
