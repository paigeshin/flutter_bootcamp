void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  print('task1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result;

  await Future.delayed(threeSeconds, (){
    result = 'task2 complete';
    print(result);
  });

  return result;
}

void task3(String task2Data) {
  print('task3 complete with $task2Data');
}
