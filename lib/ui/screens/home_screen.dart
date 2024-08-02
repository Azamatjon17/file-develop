import 'package:dars88_upload_download/blocs/file/file_bloc.dart';
import 'package:dars88_upload_download/ui/screens/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search files...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<FileBloc, FileState>(
        bloc: context.read<FileBloc>()..add(GetFiles()),
        builder: (context, state) {
          if (state.status == FileStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == FileStatus.error) {
            return Center(
              child: Text(state.errorMessage ?? "An error occurred"),
            );
          }

          if (state.files == null || state.files!.isEmpty) {
            return const Center(
              child: Text("Fayllar mavjud emas"),
            );
          }

          ///faylarni searchqilingan da ajratish
          final files = state.files!
              .where((file) => file.title.toLowerCase().contains(_searchQuery))
              .toList();

          return GridView.builder(
            itemCount: files.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (ctx, index) {
              final file = files[index];
              return InkWell(
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 180,
                        child: Image.network(
                          file.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(file.title),
                      const Gap(5),
                      // Uncomment if you want to include action buttons
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         context
                      //             .read<FileBloc>()
                      //             .add(UploadFile(file: file));
                      //       },
                      //       icon: const Icon(
                      //         Icons.upload,
                      //         size: 40,
                      //         color: Colors.red,
                      //       ),
                      //     ),
                      //     file.isLoading
                      //         ? const CircularProgressIndicator()
                      //         : IconButton(
                      //             onPressed: () {
                      //               if (file.isDownloaded) {
                      //                 // open
                      //                 context
                      //                     .read<FileBloc>()
                      //                     .add(OpenFile(filePath: file.saveUrl));
                      //               } else {
                      //                 context
                      //                     .read<FileBloc>()
                      //                     .add(DownloadFile(file: file));
                      //               }
                      //             },
                      //             icon: Icon(
                      //               file.isDownloaded
                      //                   ? Icons.check
                      //                   : Icons.download,
                      //               size: 40,
                      //               color: Colors.blue,
                      //             ),
                      //           ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => BookDetails(fileModel: file),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
