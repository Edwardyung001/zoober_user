import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';


class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedPayment = 'UPI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text('Payment method',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: buttonrightcolor,
                  child: Icon(
                    Icons.add_card,
                    color: white,
                  )),
              title: const Text('Add a new card'),
              onTap: () {
                // Handle add new card action
              },
              trailing: Icon(Icons.keyboard_double_arrow_right_sharp),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                'CREDIT CARDS',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            _buildCreditCardTile('VISA', '**** 3765', Icons.credit_card),
            _buildCreditCardTile(
                'PayPal', 'Loke112@paypal.com', Icons.account_balance_wallet),
            _buildCreditCardTile('Master Card', '**** 8562', Icons.credit_card),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.qr_code,
                      color: const Color.fromARGB(255, 1, 29, 51)),
                  title: const Text('Select app'),
                  subtitle: const Text('Pay with any UPI app'),
                  trailing: Radio<String>(
                    activeColor: buttonrightcolor,
                    value: 'UPI',
                    groupValue: _selectedPayment,
                    onChanged: (value) {
                      setState(() {
                        _selectedPayment = value!;
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.money,
                    color: const Color.fromARGB(255, 1, 29, 51)),
                title: const Text('Cash'),
                subtitle: const Text('You can pay via cash'),
                trailing: Radio<String>(
                  activeColor: buttonrightcolor,
                  value: 'Cash',
                  groupValue: _selectedPayment,
                  onChanged: (value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
            SizedBox(width: double.infinity, child: custombutton(text: "Pay")),
          ],
        ),
      ),
    );
  }

  ListTile _buildCreditCardTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: buttonrightcolor, child: Icon(icon, color: white)),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Handle credit card selection
      },
    );
  }
}
