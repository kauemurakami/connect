import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomExitButtonWidget extends StatelessWidget {
//repository injection
//final MyRepository repository = MyRepository(apiClient: MyApiClient(httpClient: http.Client()));
  final VoidCallback callback;
  CustomExitButtonWidget({@required this.callback});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: this.callback,
          child: Container(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.exit_to_app,
                color: Colors.redAccent,
              )),
        )
      ],
    );
  }
}
