import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutletDetailsScreen extends StatefulWidget {
  final String outletName;

  const OutletDetailsScreen({Key? key, required this.outletName}) : super(key: key);

  @override
  State<OutletDetailsScreen> createState() => _OutletDetailsScreenState();
}

class _OutletDetailsScreenState extends State<OutletDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.outletName),
      ),
      body: Center(
        child: Text("Outlet Details for ${widget.outletName}"),
      ),
    );
  }
}