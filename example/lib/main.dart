import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gsform/gs_form/enums/field_status.dart';
import 'package:gsform/gs_form/enums/required_check_list_enum.dart';
import 'package:gsform/gs_form/model/data_model/check_data_model.dart';
import 'package:gsform/gs_form/model/data_model/date_data_model.dart';
import 'package:gsform/gs_form/model/data_model/radio_data_model.dart';
import 'package:gsform/gs_form/model/data_model/spinner_data_model.dart';
import 'package:gsform/gs_form/widget/field.dart';
import 'package:gsform/gs_form/widget/form.dart';
import 'package:gsform/gs_form/widget/section.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'US'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        // uses `flutter_localizations`
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('fa', 'IR')],
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        backgroundColor: const Color(0xfff5f5f5),
        textTheme: null,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark, backgroundColor: const Color(0xff3c3c3c)),
      home: MainTestPage(),
    );
  }
}

// ignore: must_be_immutable
class MainTestPage extends StatelessWidget {
  MainTestPage({Key? key}) : super(key: key);

  late GSForm form;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GSForm example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(builder: (BuildContext context) => MultiSectionForm()),
                      (route) => true, //if you want to disable back feature set to false
                    );
                  },
                  child: const Text('Multi Section form'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(builder: (BuildContext context) => SingleSectionForm()),
                        (route) => true);
                  },
                  child: const Text('Single Section form'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SingleSectionForm extends StatelessWidget {
  SingleSectionForm({Key? key}) : super(key: key);

  late GSForm form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single section Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: form = GSForm.singleSection(
                    context,
                    fields: [
                      GSField.text(
                        status: GSFieldStatusEnum.disabled,
                        tag: 'name',
                        title: 'First Name',
                        minLine: 1,
                        maxLine: 1,
                        weight: 6,
                        hint: 'jhon',
                        value: 'سعید دسترس1',
                        required: false,
                        errorMessage: 'please enter a name',
                      ),
                      GSField.text(
                        value: 'سعید دسترس',
                        tag: 'lastName',
                        title: 'Last name',
                        minLine: 1,
                        maxLine: 1,
                        weight: 6,
                        required: true,
                      ),
                      GSField.password(
                        tag: 'password',
                        title: 'Password',
                        helpMessage: 'contain letter and number',
                        errorMessage: 'error',
                        weight: 12,
                        required: true,
                      ),
                      GSField.datePicker(
                        tag: 'licenceExpireDate',
                        title: 'Birth Date',
                        weight: 12,
                        required: true,
                        postfixWidget: const Icon(
                          Icons.calendar_month,
                          color: Color(0xff676767),
                        ),
                        displayDateType: GSDateFormatType.fullText,
                        initialDate: GSDate(
                          day: DateTime.now().day,
                          month: DateTime.now().month,
                          year: DateTime.now().year,
                        ),
                        calendarType: GSCalendarType.gregorian,
                      ),
                      GSField.spinner(
                        tag: 'customer_type',
                        required: false,
                        weight: 12,
                        title: 'Gender',
                        items: [
                          SpinnerDataModel(
                            name: 'man',
                            id: 1,
                          ),
                          SpinnerDataModel(
                            name: 'woman',
                            id: 2,
                          ),
                        ],
                      ),
                      GSField.mobile(
                        tag: 'mobile',
                        title: 'Phone number',
                        maxLength: 11,
                        helpMessage: '9357814747',
                        weight: 12,
                        required: false,
                        errorMessage: 'some error',
                      ),
                      GSField.email(
                        tag: 'email',
                        title: 'Email',
                        errorMessage: 'error',
                        helpMessage: 'someemail@gmail.com',
                        postfixWidget: const Icon(Icons.email, color: Color(0xff676767)),
                        weight: 12,
                        required: false,
                      ),
                      GSField.checkList(
                        hint: 'CheckBox List',
                        tag: 'check',
                        showScrollBar: true,
                        scrollBarColor: Colors.red,
                        height: 200,
                        scrollable: true,
                        requiredCheckListEnum: RequiredCheckListEnum.none,
                        weight: 12,
                        title: 'Size number',
                        searchable: true,
                        searchHint: 'Search...',
                        searchIcon: const Icon(Icons.search),
                        searchBoxDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        items: [
                          CheckDataModel(
                              title: 'checkbox ga;oj  ou ougaqou rou wrou or uoru our roro rwoe wreo or roujrowrjwrojbrgo rjwebo;gjrojbr orjb ', isSelected: true),
                          CheckDataModel(title: 'ipsum', isSelected: false),
                          CheckDataModel(title: 'item', isSelected: true),
                          CheckDataModel(title: 'size', isSelected: false),
                          CheckDataModel(title: 'size 1', isSelected: false),
                          CheckDataModel(title: 'size 2', isSelected: false),
                          CheckDataModel(title: 'sample 1', isSelected: false),
                          CheckDataModel(title: 'Sample 2', isSelected: false),
                          CheckDataModel(title: 'Radio', isSelected: false),
                          CheckDataModel(title: 'Tv', isSelected: false),
                          CheckDataModel(title: 'data 1', isSelected: false),
                          CheckDataModel(title: 'data 2', isSelected: false),
                        ],
                        callBack: (data) {},
                      ),
                      GSField.radioGroup(
                        hint: 'Radio Group',
                        tag: 'radio',
                        showScrollBar: true,
                        scrollBarColor: Colors.red,
                        height: 200,
                        scrollable: true,
                        required: true,
                        weight: 12,
                        title: 'Size number',
                        searchable: true,
                        searchHint: 'Search...',
                        searchIcon: const Icon(Icons.search),
                        searchBoxDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        items: [
                          RadioDataModel(title: 'lorem', isSelected: true),
                          RadioDataModel(title: 'ipsum', isSelected: false),
                        ],
                        callBack: (data) {},
                      ),
                      GSField.textPlain(
                        tag: 'explain',
                        title: 'Description',
                        weight: 12,
                        maxLength: 150,
                        required: true,
                      ),
                      GSField.imagePicker(
                        tag: 'a',
                        title: 'انتخاب تصویر',
                        hint: 'فایل خود را انتخاب کنید',
                        iconWidget: Lottie.asset(
                          'assets/cam.json',
                          width: 70,
                          height: 70,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid = form.isValid();
                        Map<String, dynamic> map = form.onSubmit();
                        debugPrint(isValid.toString());
                        debugPrint(map.toString());
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MultiSectionForm extends StatelessWidget {
  MultiSectionForm({Key? key}) : super(key: key);

  late GSForm form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi section screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: form = GSForm.multiSection(context, sections: [
                  GSSection(sectionTitle: 'User information', fields: [
                    GSField.text(
                      value: '2سعید دسترس',
                      tag: 'name',
                      title: 'Name',
                      minLine: 1,
                      maxLine: 1,
                    ),
                    GSField.radioGroup(
                      hint: 'Radio Group',
                      tag: 'radio',
                      showScrollBar: true,
                      scrollBarColor: Colors.red,
                      scrollDirection: Axis.horizontal,
                      height: 50,
                      scrollable: true,
                      required: true,
                      weight: 12,
                      title: 'Size number',
                      searchable: false,
                      searchHint: 'Search...',
                      searchIcon: const Icon(Icons.search),
                      searchBoxDecoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      items: [
                        RadioDataModel(title: 'lorem', isSelected: false),
                        RadioDataModel(title: 'ipsum', isSelected: false),
                      ],
                      callBack: (data) {},
                    ),
                    GSField.datePicker(
                      calendarType: GSCalendarType.gregorian,
                      tag: 'licenceExpireDate',
                      title: 'DatePicker',
                      weight: 12,
                      required: false,
                      errorMessage: 'please enter a name',
                    ),
                    GSField.text(
                      value: 'سعید دسترس3',
                      tag: 'lastName',
                      title: 'Last name',
                      minLine: 1,
                      maxLine: 1,
                      weight: 12,
                      required: true,
                    ),
                    GSField.spinner(
                      tag: 'customer_type',
                      required: false,
                      weight: 6,
                      title: 'Gender',
                      items: [
                        SpinnerDataModel(
                          name: 'man',
                          id: 1,
                        ),
                        SpinnerDataModel(
                          name: 'woman',
                          id: 2,
                        ),
                      ],
                    ),
                    GSField.mobile(
                      tag: 'mobile',
                      title: 'Phone number',
                      maxLength: 11,
                      helpMessage: '9357814747',
                      weight: 6,
                      required: false,
                      errorMessage: 'some error',
                    ),
                  ]),
                  GSSection(
                    sectionTitle: 'Market information',
                    fields: [
                      GSField.text(
                        tag: 'name',
                        title: 'Market name',
                        minLine: 1,
                        maxLine: 1,
                        weight: 12,
                        required: false,
                        errorMessage: 'please enter a name',
                      ),
                      GSField.textPlain(
                        hint: 'sds',
                        tag: 'lastName',
                        title: 'Market address',
                        maxLine: 4,
                        maxLength: 233,
                        showCounter: false,
                        weight: 12,
                        prefixWidget: const Icon(Icons.location_city, color: Colors.blue),
                        required: true,
                      ),
                      GSField.spinner(
                        tag: 'customer_type',
                        required: false,
                        weight: 6,
                        title: 'Market type',
                        items: [
                          SpinnerDataModel(
                            name: 'Super market',
                            id: 1,
                          ),
                          SpinnerDataModel(
                            name: 'woman',
                            id: 2,
                          ),
                        ],
                      ),
                      GSField.mobile(
                        tag: 'mobile',
                        title: 'Telephone',
                        maxLength: 11,
                        helpMessage: '9357814747',
                        weight: 6,
                        required: false,
                        errorMessage: 'some error',
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid = form.isValid();
                        Map<String, dynamic> map = form.onSubmit();
                        debugPrint(isValid.toString());
                        debugPrint(map.toString());
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
