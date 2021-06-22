import 'package:flutter/material.dart';
import 'package:page_view_indicators/linear_progress_page_indicator.dart';

class LinearProgressPageIndicatorDemo extends StatefulWidget {
  @override
  _LinearProgressPageIndicatorDemoState createState() {
    return _LinearProgressPageIndicatorDemoState();
  }
}

class _LinearProgressPageIndicatorDemoState
    extends State<LinearProgressPageIndicatorDemo> {
  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.amber,
    Colors.brown,
    Colors.yellow,
    Colors.blue,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinearProgressPageIndicator Demo'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildPageView(),
        _buildLinearProgressIndicator(),
      ],
    );
  }

  _buildPageView() {
    return Container(
      color: Colors.black87,
      height: _boxHeight,
      child: PageView.builder(
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                child: FlutterLogo(
                  
                  // colors: _items[index],
                  size: 40.0,
                ),
              ),
              
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildLinearProgressIndicator() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          LinearProgressPageIndicator(
            itemCount: _items.length,
            currentPageNotifier: _currentPageNotifier,
            progressColor: Colors.green,
            width: constraints.maxWidth,
            height: 30,
          ),
    );
  }
}




// import 'package:flutter/material.dart';



// class DatePickerDemo extends StatefulWidget {
//   @override
//   _DatePickerDemoState createState() => _DatePickerDemoState();
// }

// class _DatePickerDemoState extends State<DatePickerDemo> {
//   /// Which holds the selected date
//   /// Defaults to today's date.
//   DateTime selectedDate = DateTime.now();

//   _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               "${selectedDate.toLocal()}".split(' ')[0],
//               style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             RaisedButton(
//               onPressed: () => _selectDate(context),
//               child: Text(
//                 'Select date',
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//               color: Colors.greenAccent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }