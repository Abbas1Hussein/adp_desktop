# Contributing 

Firstly, thank you for considering a contribution to adp_desktop Your efforts, whether through fixing bugs, enhancing documentation, suggesting new features, or any other means, are immensely appreciated.

## 🌿 Branch Structure

* The default working branch is **`dev`**.
* The **`stable`** branch is **reserved for stable releases** published to [pub.dev](https://pub.dev/packages/adp_desktop).

All feature branches and pull requests should be based on `dev`.


## 📝 Commit Style

This repository follows **[Conventional Commits](https://www.conventionalcommits.org/)**.

Here’s a quick reference:

| Type       | Description                                           |
|------------|-------------------------------------------------------|
| `feat`     | A new feature                                         |
| `fix`      | A bug fix                                             |
| `docs`     | Documentation-only changes                            |
| `style`    | Code style changes (formatting, spacing, etc.)        |
| `refactor` | Code changes that neither fix a bug nor add a feature |
| `test`     | Adding or fixing tests                                |
| `chore`    | Changes to the build process or auxiliary tools       |


## 🚀 Pull Requests

Before Opening a Pull Request, Ensure that:

* You run `flutter pub get` at the package level
* The package version in `pubspec.yaml` is incremented following **Semantic Versioning**
* The `CHANGELOG.md` has been updated accordingly
* Code is properly formatted (`dart format .`)
* No Dart analysis warnings remain (`flutter analyze`)
* All tests pass successfully (see [test/readme.md](test/readme.md)])

> ⚠️ **Note:** Pull requests should be merged via **GitHub’s interface**, not from the command line.

## 🧾 Versioning

**adp_desktop** follows [Semantic Versioning](https://semver.org/):

| Level     | Meaning                          |
|-----------|----------------------------------|
| **MAJOR** | Incompatible API changes         |
| **MINOR** | Backward-compatible new features |
| **PATCH** | Backward-compatible bug fixes    |
