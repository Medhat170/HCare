part of 'FollowUpImports.dart';

class FollowUp extends StatefulWidget {
  const FollowUp({Key key}) : super(key: key);

  @override
  _FollowUpState createState() => _FollowUpState();
}

class _FollowUpState extends State<FollowUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'متابعة المريض',
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
