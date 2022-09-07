import 'dart:io';

void main() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  print('Starting task 1');
  print('Task 1 complete');
}

Future<String> task2() async {
  print('Starting task 2');
  // sleep(Duration(seconds: 3));
  String result;
  await Future.delayed(Duration(seconds: 3), () {
    result = 'got em';
    print('Task 2 complete');
  });

  return result;
}

void task3(String x) {
  print('Starting task 3');
  print('Got $x');
  print('Task 3 complete');
}
