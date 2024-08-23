# Animation Load Progress
## usage
```
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isAsync = false; //add variable

  void signIn() {
    isAsync = true;
    setState(() {});
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        isAsync = false;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    signIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLoadProgress(
        inAsyncCall: isAsync,
        colorProgress: Colors.red, //choose your colors
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Loading ...',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Loading Example'),
          ),
        ));
  }
}
```
