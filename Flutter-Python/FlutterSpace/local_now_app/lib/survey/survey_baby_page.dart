import 'package:flutter/material.dart';
import 'package:local_now_app/models/message_answers.dart';
import 'package:local_now_app/survey/survey_obstetrics_page.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BabyPage extends StatefulWidget {
  const BabyPage({super.key});

  @override
  State<BabyPage> createState() => _BabyPageState();
}

class _BabyPageState extends State<BabyPage> {
  _BabyPageState();

  double _value2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("출생아 숫자는"),
        ),
        body: Column(
          children: [
            const Text('출생아 수는?'),
            Lottie.asset('images/pregnant-woman.zip'),
            //LottieImageAsset(width: 0, height: 0, i

            SfSlider(
              min: -100,
              max: 100,
              value: _value2,
              showDividers: true,
              interval: 25,
              showLabels: true,
              showTicks: true,
              stepSize: 25,
              onChangeStart: (dynamic startValue) {
                print('Interaction started');
              },
              onChanged: (dynamic newValue) {
                _value2 = newValue;
                setState(() {});
              },
              // onChangeEnd: (dynamic endValue) {
              //   MessageSido.sliderPop = endValue;
              // },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // 값 저장하고 결과 페이지로
                MessageAnswers.sliderBabies = _value2;
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    //생성자로 값을 넣어주는 부분! *******************
                    //메모리에 안 올라감 -> 보안이 굿
                    //but 페이지 옮길 때 또 써줘야 해서 보안에 관련된 것만 생성자로 넘겨주기
                    return ObstetricsPage();
                  },
                ));
              },
              child: Text('다음 질문!!'),
            ),
          ],
        ));
  }
}