part of 'CheckupImports.dart';

class Checkup extends StatefulWidget {
  const Checkup({Key key}) : super(key: key);

  @override
  _CheckupState createState() => _CheckupState();
}

class _CheckupState extends State<Checkup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'فحوصات دورية',
          style: TextStyle(
            color: ColorUtil.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 60.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: ColorUtil.primaryColor,
            ),
          )
        ],
      ),
      body: EmptyWidget(),
    );
  }
}
