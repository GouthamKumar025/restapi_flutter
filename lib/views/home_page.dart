import 'package:api_demo/model/post.dart';
import 'package:api_demo/services/remote_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API DEMO"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(posts![index].body),
            );
          },
        ),
        replacement: CircularProgressIndicator(),
      ),
    );
  }
}
