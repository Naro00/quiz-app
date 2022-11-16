import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    ///미디어쿼리를 이용하여 사용자가 사용하는 기기의 사이즈를 받아옴///
    double width = screenSize.width;
    double height = screenSize.height;
    //받아온 사이즈를 바탕으로 높이와 넓이를 정해줌//

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('My Quiz APP'),
            backgroundColor: Colors.deepPurple,
            leading: Container(), //페이지 이동 시에 자동으로 생겨나는 뒤로가기 버튼 등을 지우는 효과
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/quiz.png',
                  width: width * 0.8,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
              Text(
                '플러터 퀴즈 앱',
                style: TextStyle(
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '퀴즈를 풀기 전 안내사항입니다. \n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.048),
              ),
              _buildStep(width, '랜덤으로 나오는 퀴즈를 풀어보세요.'),
              _buildStep(width, '문제를 잘 읽고 정답을 고른 뒤 \n다음 문제 버튼을 눌러주세요.'),
              Padding(
                padding: EdgeInsets.all(width * 0.048),
              ),
              //아래 컨테이너는 시작 버튼
              Container(
                padding: EdgeInsets.only(bottom: width * 0.036),
                child: Center(
                  child: ButtonTheme(
                    minWidth: width * 0.8,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RaisedButton(
                      child: Text(
                        '지금 시작 하기',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.deepPurple,
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

//_buildstep 함수를 따로 만들어 스크린이 뜨는 화면에 적용 (여러번 사용하는 스타일이나 규칙의 경우 이렇게 함수로 만드는게 편하니까!)
  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}
// safearea 는 기기의 상단 바와 하단 영역을 침범하지 않는 안전한 영역을 잡아주는 역할을 한다.
