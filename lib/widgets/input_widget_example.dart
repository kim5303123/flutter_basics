import 'package:flutter/material.dart';

// stful 자동생성
class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample({super.key});

  @override
  State<InputWidgetExample> createState() => _InputWidgetExampleState();
}

class _InputWidgetExampleState extends State<InputWidgetExample> {
  //  텍스트 에디트 컨트롤러
  final TextEditingController _controller = TextEditingController();

  //  상태 변수
  String _inputText = "";
  bool _isChecked = false;
  int _radioValue = 0;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Image Widget: from Assets',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Tooltip(
          message: "안드로이드 로고입니다",
          child: Image.asset('assets/images/android.png'),
        ),
        SizedBox(height: 20),
        Text(
          "Image Widget from Network",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Tooltip(
          message: "네트워크로부터 불러온 이미지",
          child: Image.network(
            "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnoC/image/L5UV5eFyTS1Ar4MTDDOd_Ynrzt4",
            width: 200,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Icon Widgets",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red),
            Icon(Icons.mail, color: Colors.blue),
            Icon(Icons.settings, color: Colors.green),
          ],
        ),
      ],
    );
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: "문장을 입력하세요"),
            onChanged: (text) {
              setState(() {
                _inputText = text;
              });
            },
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text("Check Me!!"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Radio<int>(
                value: 0,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value ?? 0;
                  });
                },
              ),
              Text("Option 1"),
              Radio<int>(
                value: 1,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value ?? 1;
                  });
                },
              ),
              Text("Option 2"),
            ],
          ),
          SizedBox(height: 20),
          Slider(
            value: _sliderValue,
            min: 0.0,
            max: 100.0,
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Text("Slider Value: ${_sliderValue.toStringAsFixed(1)}"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              //  AlertDialog 띄우기
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("입력 데이터들"),
                    content: Column(
                      children: <Widget>[
                        Text("TextInput: $_inputText"), //  텍스트 입력 상자 값
                        Text("Checkbox: $_isChecked"), //  체크 여부
                        Text("Radio: $_radioValue"), //  선택된 라디오 옵션
                        Text("Slider: ${_sliderValue.toStringAsFixed(1)}"),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //  스택에서 제거
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("입력 내용 확인 (AlertDialog)"),
          ),
          SizedBox(height: 100),
          TextField(),
        ],
      ),
    );
  }
}
