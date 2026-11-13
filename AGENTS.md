# Project Rules

## Project Overview
- Flutter mobile app written in Dart.
- State management: BLoC / Cubit.
- Architecture: Clean Architecture (data / domain / presentation layers).
- Networking: Dio. Backend: Firebase and REST APIs.

## Terminal Command Rules (IMPORTANT)
- Do NOT run any terminal command unless I explicitly ask for it.
- Never run `flutter run`, `flutter build`, `flutter analyze`, `flutter test`,
  or `flutter pub get` on your own. I will run them myself and send you the errors.
- If you think a command is needed, tell me which one and why, then wait.

## Scope Rules
- Only edit the files I mention or files directly required for the task.
- Do not refactor, rename, or reformat unrelated code.
- Do not scan the entire project. Ask me for the file if you need it.
- Do not create new files unless the task requires it.

## Response Rules
- Keep explanations short (2-4 sentences) unless I ask for details.
- Show only the changed code, not the whole file.
- If the task is unclear, ask one clarifying question before coding.
- If a fix fails twice, stop and ask me instead of retrying in a loop.

## Code Style
- Follow Effective Dart naming conventions.
- Use `const` constructors wherever possible.
- Keep widgets small and reusable.
- Keep business logic out of widgets (inside Cubit/Bloc and use cases).
- Handle loading, success, and error states in every Cubit.