#ORUPHONES
A tech start-up, India's first-ever online C2C marketplace dedicated to buying and selling Old, Refurbished & Used phones.


#SDK VERSION
Flutter 3.10.5 Stable channel
Dart 3.0.5

#Packages Used
Dio for http Requests
flutter svg for rendring svgs.
cached_network_image for loading network images.
provider for state management.
intl for converting date. 
firebase_core, firebase_messaging, flutter_local_notifications for FCM push notifications.
cloud_firestore for storing fcm tokens.



#API Reference
Link to package manager website.
https://pub.dev/


##Run Locally
Before running Flutter on your machine locally, there are a few things you should check:
System Requirements: Ensure that your computer meets the minimum system requirements to run Flutter. You can check the system requirements on the Flutter website.

Install Flutter: You will need to download and install the Flutter SDK on your machine. You can follow the installation instructions provided on the Flutter website.

Install IDE: Install an Integrated Development Environment (IDE) for Flutter development. Popular options include Android Studio, IntelliJ IDEA, and Visual Studio Code. Ensure that the IDE is properly configured to work with Flutter.

Install Dependencies: Depending on the platform you want to develop for, you may need to install additional dependencies. For example, if you want to develop for iOS, you will need to install Xcode and the iOS simulator.

Set up an emulator: You will need an emulator to test your app. You can use the Android Virtual Device Manager in Android Studio to create an emulator for Android, or the iOS simulator in Xcode to create an emulator for iOS.

Run Flutter doctor: Run the flutter doctor command in your terminal to check if there are any issues with your Flutter installation or environment. This command will also provide suggestions on how to resolve any issues that are detected.

Once you have completed these steps, you should be able to run Flutter on your machine locally and start developing your app.

first run entrypoint in terminal to clean and get dependencies





#RELEASE APK
flutter build apk --relase for fat apk.
flutter buil apk --split-per-abi for architectural wise distributed archive. 

#BUILD APP BUNDLE
flutter build appbundle --no-tree-shake-icons


#MEMORY OPTIMIZATION
=> For better memory optimization we are using vector images which are very less in comparison to jpg or png.
=> We are using the CachedNetworkImage package for loading images which uses lazy loading so the memory consumption will be less while loading a list of images. 
=> We have optimized the code as per the flutter and dart lint we are using const and final everywhere where it is possible,  which will avoid memory leaks.
=> We are using maxCachedDiskHieght and maxCachedDiskWidth of the CachedNetowkImage so that the images will be scaled down to the minimum which will load them faster and uses less memory.
=> We are using provider state management and avoiding the unnecessary Ui build. 
=> We are Disposing of the resources after their consumption to avoid memory leaks.
=> We are Avoiding unnecessary duplication of data and using efficient data structures to minimize memory consumption. For example, consider using 'ListView.builder' instead of 'ListView' for long lists to only render items that are currently visible on the screen.
=> We are avoiding duplication of code and making a common widget or function to call them in multiple classes. 

