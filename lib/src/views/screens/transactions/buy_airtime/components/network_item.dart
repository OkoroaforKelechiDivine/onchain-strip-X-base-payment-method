import 'package:flutter/material.dart';

class NetworkItem extends StatelessWidget {
  final String networkName;
  final String logoAsset;

  const NetworkItem({
    super.key,
    required this.networkName,
    required this.logoAsset,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem<String>(
      value: networkName,
      child: Row(
        children: [
          Image.asset(logoAsset, width: 40),
          const SizedBox(width: 8),
          Text(networkName),
        ],
      ),
    );
  }
}
