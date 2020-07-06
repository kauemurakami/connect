import 'package:connect/app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
//repository injection
//final MyRepository repository = MyRepository(apiClient: MyApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          bgColor: Colors.green,
          color: Colors.white,
          text: 'Usina Oliveira',
          iconsColor: Colors.white,
          icons: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
        ),
      body: Container(
        child: Text('aaaaaaaaaaaa'),
      ),
    );
  }
}
