import 'package:flutter/material.dart';
import 'package:webtoon/api_services/api_service.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Todays toon",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
        // return Column(
        //   children: [
        //     Container(
        //       clipBehavior: Clip.hardEdge,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(15),
        //         boxShadow: [
        //           BoxShadow(
        //             blurRadius: 15,
        //             offset: const Offset(10, 10),
        //             color: Colors.black.withOpacity(0.5),
        //           ),
        //         ],
        //       ),
        //       width: 250,
        //       child: Image.network(
        //         webtoon.thumb,
        //         headers: const {
        //           "User-Agent":
        //               "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        //         },
        //         errorBuilder: (context, error, stackTrace) {
        //           return const Icon(
        //             Icons.error,
        //             color: Colors.red,
        //           );
        //         },
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Text(
        //       webtoon.title,
        //       style: const TextStyle(
        //         fontSize: 22,
        //       ),
        //     ),
        //   ],
        // );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
