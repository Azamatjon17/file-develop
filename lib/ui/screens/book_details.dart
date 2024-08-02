import 'package:dars88_upload_download/blocs/file/file_bloc.dart';
import 'package:dars88_upload_download/data/models/file_model.dart';
import 'package:dars88_upload_download/ui/widgets/fillled_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.fileModel});
  final FileModel fileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                fileModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileModel.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                      height:
                          10), // Added spacing between title and description
                  Text(
                    fileModel.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors
                          .white70, // Lightened text color for readability
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: InkWell(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_sharp,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if (fileModel.isDownloaded) {
                    context
                        .read<FileBloc>()
                        .add(OpenFile(filePath: fileModel.saveUrl));
                  } else {
                    context.read<FileBloc>().add(DownloadFile(file: fileModel));
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<FileBloc>().add(
                            UploadFile(file: fileModel),
                          );
                    },
                    icon: const Icon(
                      Icons.upload,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: FilledButtonWidget(
                      isActive: fileModel.isLoading ? false : true,
                      text: fileModel.isDownloaded ? "Read" : "Download",
                      function: () {
                        if (fileModel.isLoading) {
                          null;
                        }
                        if (fileModel.isDownloaded) {
                          context.read<FileBloc>().add(
                                OpenFile(filePath: fileModel.saveUrl),
                              );
                        } else {
                          context.read<FileBloc>().add(
                                DownloadFile(file: fileModel),
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
