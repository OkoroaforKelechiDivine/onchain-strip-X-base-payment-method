import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/customer_tile.dart';

class CustomerTab extends StatelessWidget {
  const CustomerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemCount: 20,
        //hrinkWrap: true,
        itemBuilder: (context, index) {
          return const CustomerTile(
            title: "John Doe",
            subtitle: "iglory6@gmail.com",
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
