

# ORUPHONES

A tech start-up, India's first-ever online C2C marketplace dedicated to buying and selling Old, Refurbished & Used phones.

## SDK VERSION

Flutter 3.10.5 Stable channel
Dart 3.0.5

## Packages Used

- Dio for HTTP Requests
- flutter_svg for rendering SVGs
- cached_network_image for loading network images
- provider for state management
- intl for converting dates
- firebase_core, firebase_messaging, flutter_local_notifications for FCM push notifications
- cloud_firestore for storing FCM tokens

## API Reference

Link to the package manager website: [pub.dev](https://pub.dev/)

## Run Locally

Before running Flutter on your machine locally, there are a few things you should check:

1. **System Requirements:** Ensure that your computer meets the minimum system requirements to run Flutter. You can check the system requirements on the Flutter website.

2. **Install Flutter:** You will need to download and install the Flutter SDK on your machine. You can follow the installation instructions provided on the Flutter website.

3. **Install IDE:** Install an Integrated Development Environment (IDE) for Flutter development. Popular options include Android Studio, IntelliJ IDEA, and Visual Studio Code. Ensure that the IDE is properly configured to work with Flutter.

4. **Install Dependencies:** Depending on the platform you want to develop for, you may need to install additional dependencies. For example, if you want to develop for iOS, you will need to install Xcode and the iOS simulator.

5. **Set up an emulator:** You will need an emulator to test your app. You can use the Android Virtual Device Manager in Android Studio to create an emulator for Android or the iOS simulator in Xcode to create an emulator for iOS.

6. **Run Flutter doctor:** Run the `flutter doctor` command in your terminal to check if there are any issues with your Flutter installation or environment. This command will also provide suggestions on how to resolve any issues that are detected.

Once you have completed these steps, you should be able to run Flutter on your machine locally and start developing your app.

To get started, run the entrypoint in the terminal to clean and get dependencies.

## RELEASE APK

- To build a fat APK: `flutter build apk --release`
- To build an APK with architectural-wise distributed archive: `flutter build apk --split-abi`

## BUILD APP BUNDLE

`flutter build appbundle --no-tree-shake-icons`

## MEMORY OPTIMIZATION

To achieve better memory optimization, we have implemented the following strategies:

- Using vector images which are smaller in size compared to JPG or PNG.
- Utilizing the `CachedNetworkImage` package for lazy loading of images, reducing memory consumption while loading a list of images.
- Optimizing code by using `const` and `final` wherever possible to avoid memory leaks.
- Setting `maxCachedDiskHeight` and `maxCachedDiskWidth` for `CachedNetworkImage` to scale down images and load them faster, using less memory.
- Implementing provider state management and avoiding unnecessary UI builds.
- Disposing of resources after their consumption to prevent memory leaks.
- Avoiding unnecessary duplication of data and using efficient data structures to minimize memory consumption. For instance, considering using `ListView.builder` instead of `ListView` for long lists to render only visible items on the screen.
- Avoiding duplication of code and creating common widgets or functions to be reused in multiple classes.

---

Please note that the above formatting is done using Markdown syntax. If you wish to use it in a .md file, you can simply copy and paste the content into the file.
