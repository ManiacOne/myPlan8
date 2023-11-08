part of 'track_cubit.dart';

abstract class TrackState {}

final class TrackInitial extends TrackState {}

final class TrackLoading extends TrackState {}

final class TrackSuccess extends TrackState {}

final class TrackError extends TrackState {
  final String errorMessage;
  TrackError({required this.errorMessage});
}
