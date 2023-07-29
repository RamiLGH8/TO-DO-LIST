import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(229, 0, 0, 1),
              Color.fromRGBO(21, 147, 175, 1)
            ],
          )),
          child: Center(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Color.fromRGBO(34, 34, 34, 1),
                    ),
                    height: 570,
                    width: 312,
                    child: Column(
                      children: [
                        Image(image: AssetImage('images/Logo.png')),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Make successful',
                            style: TextStyle(
                              fontFamily: 'font1',
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'your day',
                            style: TextStyle(
                              fontFamily: 'font1',
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 110,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Make small somethings to get',
                            style: TextStyle(
                              fontFamily: 'font2',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(193, 204, 65, 1),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'big gift in your life',
                            style: TextStyle(
                              fontFamily: 'font2',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(193, 204, 65, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addTasks()));
                          },
                          child: Text(
                            'Start',
                            style: TextStyle(
                                fontFamily: 'font2',
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(
                                26, 184, 219, 1), // Background color
                            onPrimary: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 45), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Button border radius
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class addTasks extends StatefulWidget {
  const addTasks({super.key});

  @override
  State<addTasks> createState() => _addTasksState();
}

class _addTasksState extends State<addTasks> {
  static List<String> _texts = [];
  static List<String> _dates = [];
  static List<String> _descriptions = [];
  static bool isVisible = false;
  static bool noTasks = true;
  static int containerCount = 0;
  static List<bool> _checked = [false];
  static int indx = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                child: Image(image: AssetImage('images/Logo.png')),
              ),
              Center(
                child: Container(
                  width: 390,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.0),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$containerCount Todos',
                        style: TextStyle(
                            fontFamily: 'font2', fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: (() {}),
                          child: Text(
                            'View all',
                            style: TextStyle(
                                fontFamily: 'font2',
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(26, 184, 219, 1)),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                height: 530,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(217, 217, 217, 1)),
                      child: Row(children: [
                        Checkbox(value: false, onChanged: ((value) {})),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Date',
                          style: TextStyle(
                              fontFamily: 'font2',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text('Task',
                            style: TextStyle(
                                fontFamily: 'font2',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        color: Colors.red,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Column(
                          children: [
                            Visibility(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                  ),
                                  Text(
                                    'No tasks',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'font2',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              visible: noTasks,
                            ),
                            Visibility(
                              visible: isVisible,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  itemCount: containerCount,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        indx = index;
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    (taskDetails())));
                                      },
                                      child: Container(
                                        width: 400,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color.fromRGBO(
                                                      26, 184, 219, 1)),
                                              child: Row(children: [
                                                Checkbox(
                                                    value: _checked[index],
                                                    onChanged: ((bool? value) {
                                                      setState(() {
                                                        _checked[index] =
                                                            value!;
                                                      });
                                                    })),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  _dates[index],
                                                  style: TextStyle(
                                                      fontFamily: 'font2',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                Container(
                                                  width: 186,
                                                  child: Text(_texts[index],
                                                      style: TextStyle(
                                                          fontFamily: 'font2',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ]),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color.fromRGBO(26, 184, 219, 1),
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addTasks1()));
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////

class addTasks1 extends StatefulWidget {
  const addTasks1({super.key});

  @override
  State<addTasks1> createState() => _addTasks1State();
}

class _addTasks1State extends State<addTasks1> {
  TextEditingController _taskTitle = TextEditingController();
  TextEditingController _taskDescription = TextEditingController();
  TextEditingController _taskdate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 17,
                  ),
                  Text(
                    'ADD TASK',
                    style: TextStyle(
                        fontFamily: 'font2',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(26, 184, 219, 1)),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 45,
                        color: Color.fromRGBO(26, 184, 219, 1),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Image(image: AssetImage('images/Logo.png')),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 470,
                width: 300,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'font2',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextField(
                      style: TextStyle(
                          fontFamily: 'font2', fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your task',
                          hintStyle: TextStyle(
                              fontFamily: 'font2',
                              fontWeight: FontWeight.bold)),
                      controller: _taskTitle,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'font2',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextField(
                      style: TextStyle(
                          fontFamily: 'font2', fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter task description',
                          hintStyle: TextStyle(
                              fontFamily: 'font2',
                              fontWeight: FontWeight.bold)),
                      controller: _taskDescription,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'font2',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextField(
                      style: TextStyle(
                          fontFamily: 'font2', fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Click here to choose date',
                          hintStyle: TextStyle(
                              fontFamily: 'font2',
                              fontWeight: FontWeight.bold)),
                      controller: _taskdate,
                      onTap: () async {
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2030));
                        if (pickDate != null)
                          _taskdate.text = DateFormat.yMMMd().format(pickDate);
                      },
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: (() {
                            setState(() {
                              if (_addTasksState.containerCount == 0) {
                                _addTasksState.noTasks = false;
                                _addTasksState.isVisible = true;
                              }

                              _addTasksState.containerCount++;
                              _addTasksState._texts.add(_taskTitle.text);
                              _addTasksState._dates.add(_taskdate.text);
                              _addTasksState._descriptions
                                  .add(_taskDescription.text);
                              if ((_addTasksState._checked).length != 0)
                                _addTasksState._checked.add(false);
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => addTasks()));
                            });
                          }),
                          child: Text(
                            'Add',
                            style: TextStyle(
                                fontFamily: 'font2',
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(26, 184, 219, 1),
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 23), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Button border radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (() {}),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontFamily: 'font2',
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 0, 0, 1),
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 15), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Button border radius
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              )
            ]),
          ),
        ),
      ),
    ));
  }
}

class taskDetails extends StatefulWidget {
  const taskDetails({super.key});

  @override
  State<taskDetails> createState() => _taskDetailsState();
}

class _taskDetailsState extends State<taskDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Image(image: AssetImage('images/Logo.png'))),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Task Details',
                style: TextStyle(
                    fontFamily: 'font2',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromRGBO(26, 184, 219, 1)),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromRGBO(26, 184, 219, 1),
                ),
                padding: EdgeInsets.only(left: 10),
                width: 400,
                child: Text(
                  _addTasksState._texts[_addTasksState.indx],
                  style: TextStyle(
                      fontFamily: 'font2',
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromRGBO(26, 184, 219, 1),
                ),
                width: 400,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  _addTasksState._dates[_addTasksState.indx],
                  style: TextStyle(
                      fontFamily: 'font2',
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(26, 184, 219, 1),
              ),
              width: 400,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                _addTasksState._descriptions[_addTasksState.indx],
                style: TextStyle(
                    fontFamily: 'font2',
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: OutlinedButton(
              onPressed: (() {
                if (_addTasksState.containerCount == 0) {
                  _addTasksState.containerCount = 0;
                  _addTasksState._checked = [false];
                  _addTasksState._dates = [];
                  _addTasksState._descriptions = [];
                  _addTasksState._texts = [];
                  _addTasksState.containerCount = 0;
                }
                if (_addTasksState.containerCount == 1) {
                  _addTasksState.isVisible = false;
                  _addTasksState.noTasks = true;
                  _addTasksState.indx = 0;
                }
                print(_addTasksState.indx);
                _addTasksState._checked.removeAt(_addTasksState.indx);
                _addTasksState._dates.removeAt(_addTasksState.indx);
                _addTasksState._descriptions.removeAt(_addTasksState.indx);
                _addTasksState._texts.removeAt(_addTasksState.indx);
                _addTasksState.containerCount--;
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addTasks()));
              }),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red, width: 1),
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  primary: Colors.red,
                  shadowColor: Colors.red),
              child: Text(
                'Delete',
                style: TextStyle(
                  fontFamily: 'font2',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
