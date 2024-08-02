import 'package:dars88_upload_download/data/models/file_model.dart';

class FileRepository {
  final List<FileModel> _files = [
    FileModel(
      id: 1,
      title: "Harry Potter Image",
      url:
          "https://static0.srcdn.com/wordpress/wp-content/uploads/2023/08/harry-potter-movies-length-runtime.jpg",
      imageUrl:
          "https://static0.srcdn.com/wordpress/wp-content/uploads/2023/08/harry-potter-movies-length-runtime.jpg",
      description:
          "eaturing vivid descriptions and an imaginative story line, it followed the adventures of the unlikely hero Harry Potter, a lonely orphan who discovers that he is actually a wizard and enrolls in the Hogwarts School of Witchcraft and Wizardry. The book received numerous awards, including the British Book Award.",
      videoUrl:
          "https://videos.pexels.com/video-files/7977616/7977616-hd_1920_1080_30fps.mp4",
      category: ["urban fantasy", "contemporary fantasy", "low fantasy"],
    ),
    FileModel(
      id: 2,
      title: "Harry Potter PDF",
      url:
          "https://vidyaprabodhinicollege.edu.in/VPCCECM/ebooks/ENGLISH%20LITERATURE/Harry%20potter/(Book%207)%20Harry%20Potter%20And%20The%20Deathly%20Hallows.pdf",
      imageUrl:
          "https://static0.srcdn.com/wordpress/wp-content/uploads/2023/08/harry-potter-movies-length-runtime.jpg",
      description:
          "eaturing vivid descriptions and an imaginative story line, it followed the adventures of the unlikely hero Harry Potter, a lonely orphan who discovers that he is actually a wizard and enrolls in the Hogwarts School of Witchcraft and Wizardry. The book received numerous awards, including the British Book Award.",
      videoUrl:
          "https://videos.pexels.com/video-files/7977616/7977616-hd_1920_1080_30fps.mp4",
      category: ["urban fantasy"],
    ),
    FileModel(
      id: 3,
      title: "Harry Potter Video",
      url:
          "https://videos.pexels.com/video-files/7977616/7977616-hd_1920_1080_30fps.mp4",
      imageUrl:
          "https://static0.srcdn.com/wordpress/wp-content/uploads/2023/08/harry-potter-movies-length-runtime.jpg",
      description:
          "eaturing vivid descriptions and an imaginative story line, it followed the adventures of the unlikely hero Harry Potter, a lonely orphan who discovers that he is actually a wizard and enrolls in the Hogwarts School of Witchcraft and Wizardry. The book received numerous awards, including the British Book Award.",
      videoUrl:
          "https://videos.pexels.com/video-files/7977616/7977616-hd_1920_1080_30fps.mp4",
      category: ["low fantasy"],
    ),
    FileModel(
      id: 4,
      title: "Harry Potter Song",
      url:
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      imageUrl:
          "https://static0.srcdn.com/wordpress/wp-content/uploads/2023/08/harry-potter-movies-length-runtime.jpg",
      description:
          "eaturing vivid descriptions and an imaginative story line, it followed the adventures of the unlikely hero Harry Potter, a lonely orphan who discovers that he is actually a wizard and enrolls in the Hogwarts School of Witchcraft and Wizardry. The book received numerous awards, including the British Book Award.",
      videoUrl:
          "https://videos.pexels.com/video-files/7977616/7977616-hd_1920_1080_30fps.mp4",
      category: ["low fantasy"],
    ),
  ];

  List<FileModel> getFiles() {
    return [..._files];
  }
}
