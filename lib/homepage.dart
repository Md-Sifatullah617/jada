import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jada/api/api.dart';
import 'package:jada/main.dart';
import 'package:jada/model.dart/usermodel.dart';
import 'package:jada/provider/view.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final number = ref.watch(countMeIN);

    ref.listen(countMeIN, (previous, next) {
      if (next == 5) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Attention"),
                content: Text("Hi you reached at $next"),
              );
            });
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jada"),
        actions: [
          IconButton(
              onPressed: () {
                // ref.refresh(countMeIN);
                ref.invalidate(countMeIN);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //three buttons to navigate to the three main pages
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FamilyMember()));
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      (MediaQuery.sizeOf(context) * 0.1))),
              child: Text(name),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  number.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //   ref.read(countMeIN.notifier).state++;
          ref.read(countMeIN.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
