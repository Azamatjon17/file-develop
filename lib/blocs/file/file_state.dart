part of 'file_bloc.dart';

enum FileStatus {
  loading,
  loaded,
  error,
  initial,
}

final class FileState {
  FileStatus? status;
  List<FileModel>? files;
  String? errorMessage;

  FileState({
    this.status,
    this.files,
    this.errorMessage,
  });

  FileState copyWith({
    FileStatus? status,
    List<FileModel>? files,
    String? errorMessage,
  }) {
    return FileState(
      status: status ?? this.status,
      files: files ?? this.files,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}



// final class LoadingState {}

// final class LoadedState {}

// final class ErrorState {}

// final class InitialState {}
