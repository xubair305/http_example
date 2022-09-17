import 'package:flutter/material.dart';
import 'package:http_example/base_client.dart';
import 'package:http_example/user_model.dart';
import 'package:http_example/user_post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Http Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var response = await BaseClient()
                    .get("/users")
                    .catchError((e) => debugPrint(e));
                if (response == null) return;
                debugPrint(response);
                var user = userFromJson(response);
                debugPrint(user.data?[0].email.toString());
              },
              child: const Text("Get Request"),
            ),
            ElevatedButton(
              onPressed: () async {
                var user = UserPost(name: "Jubair", job: "Developer");
                var response = await BaseClient()
                    .post("/users", user)
                    .catchError((e) => debugPrint(e));
                if (response == null) return;
                debugPrint(response);
                var userResponse = userPostFromJson(response);
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Id : ${userResponse.id}\nCreated At : ${userResponse.updatedAt}"),
                  ),
                );

                debugPrint(userResponse.id.toString());
              },
              child: const Text("Post Request"),
            ),
            ElevatedButton(
              onPressed: () async {
                var id = 2;
                var user = UserPost(name: "Jubair", job: "Developer");
                var response = await BaseClient()
                    .put("/users/$id", user)
                    .catchError((e) => debugPrint(e));
                if (response == null) return;
                debugPrint(response);
                var userResponse = userPostFromJson(response);
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Id : ${userResponse.id}\nCreated At : ${userResponse.updatedAt}"),
                  ),
                );

                debugPrint(userResponse.id.toString());
              },
              child: const Text("Put Request"),
            ),
            ElevatedButton(
              onPressed: () async {
                var id = 2;
                var response = await BaseClient()
                    .delete("/users/$id")
                    .catchError((e) => debugPrint(e));
                if (response == null) return;
                debugPrint("Successful");
              },
              child: const Text("Delete Request"),
            ),
          ],
        ),
      ),
    );
  }
}
