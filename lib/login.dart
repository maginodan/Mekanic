// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Constructor for the LoginPage widget

  @override
  State<LoginPage> createState() =>
      _LoginPageState(); // Create and return the state for the widget
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor; // Variable to store a color
  late Size mediaSize; // Variable to store the size of the screen
  TextEditingController emailController =
      TextEditingController(); // Text controller for the email input field
  TextEditingController passwordController =
      TextEditingController(); // Text controller for the password input field
  bool rememberUser =
      false; // Variable to track whether the user wants to be remembered

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context)
        .primaryColor; // Get the primary color from the app's theme
    mediaSize = MediaQuery.of(context).size; // Get the screen size

    // Return a Container widget with a background image and a Scaffold with transparent background
    return Container(
      decoration: BoxDecoration(
        color: myColor, // Set the background color to the primary color
        image: DecorationImage(
          image: const AssetImage(
              "assets/images/bg.png"), // Set the background image
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors
            .transparent, // Set the Scaffold's background to be transparent
        body: Stack(children: [
          Positioned(
              top: 70,
              child: _buildTop()), // Position the top content of the login page
          Positioned(
              bottom: 0,
              child:
                  _buildBottom()), // Position the bottom content of the login page
        ]),
      ),
    );
  }

  // Widget to build the top section of the login page
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.build_circle_outlined,
            size: 100,
            color: Colors.white60,
          ),
          Text(
            "Mekanic",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 1),
          )
        ],
      ),
    );
  }

  // Widget to build the bottom section of the login page
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  // Widget to build the login form
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Please login with your information"),
        const SizedBox(height: 60),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLogin(),
      ],
    );
  }

  // Widget to build a text with grey color
  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  // Widget to build an input field (text field)
  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  // Widget to build the "Remember me" checkbox and "Forgot password" link
  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGreyText("I forgot my password"),
        ),
      ],
    );
  }

  // Widget to build the login button
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.greenAccent,
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN"),
    );
  }

  // Widget to build other login options (e.g., social media login)
  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Or Login with"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/images/google.png")),
              Tab(icon: Image.asset("assets/images/facebook.png")),
              Tab(icon: Image.asset("assets/images/twitter.png")),
              Tab(icon: Image.asset("assets/images/github.png")),
            ],
          )
        ],
      ),
    );
  }
}


/////////////////////////////////////////////
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   late Color myColor;
//   late Size mediaSize;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool rememberUser = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     myColor = Theme.of(context).primaryColor;
//     mediaSize = MediaQuery.of(context).size;

//     return Container(
//       decoration: BoxDecoration(
//         color: myColor,
//         image: DecorationImage(
//           image: const AssetImage("assets/images/bg.png"),
//           fit: BoxFit.cover,
//           colorFilter:
//               ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Positioned(
//               top: 70,
//               child: _buildTop(),
//             ),
//             Positioned(
//               bottom: 0,
//               child: _buildBottom(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTop() {
//     return SizedBox(
//       width: mediaSize.width,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             Icons.build_circle_outlined,
//             size: 100,
//             color: Colors.white60,
//           ),
//           Text(
//             "Mekanic",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 40,
//               letterSpacing: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottom() {
//     return SizedBox(
//       width: mediaSize.width,
//       child: Card(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: _buildForm(),
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Welcome",
//           style: TextStyle(
//             color: myColor,
//             fontSize: 32,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         _buildGreyText("Please login with your information"),
//         const SizedBox(height: 60),
//         _buildGreyText("Email address"),
//         _buildInputField(emailController),
//         const SizedBox(height: 40),
//         _buildGreyText("Password"),
//         _buildInputField(passwordController, isPassword: true),
//         const SizedBox(height: 20),
//         _buildRememberForgot(),
//         const SizedBox(height: 20),
//         _buildLoginButton(),
//         const SizedBox(height: 20),
//         _buildOtherLogin(),
//       ],
//     );
//   }

//   Widget _buildGreyText(String text) {
//     return Text(
//       text,
//       style: const TextStyle(color: Colors.grey),
//     );
//   }

//   Widget _buildInputField(TextEditingController controller,
//       {bool isPassword = false}) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
//       ),
//       obscureText: isPassword,
//     );
//   }

//   Widget _buildRememberForgot() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Checkbox(
//               value: rememberUser,
//               onChanged: (value) {
//                 setState(() {
//                   rememberUser = value!;
//                 });
//               },
//             ),
//             _buildGreyText("Remember me"),
//           ],
//         ),
//         TextButton(
//           onPressed: () {
//             // Handle forgot password here.
//             // You can implement a password reset flow.
//           },
//           child: _buildGreyText("I forgot my password"),
//         ),
//       ],
//     );
//   }

//   Future<void> _showErrorDialog(String message) async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildLoginButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         try {
//           final email = emailController.text;
//           final password = passwordController.text;

//           await _auth.signInWithEmailAndPassword(
//             email: email,
//             password: password,
//           );

//           // Login successful, navigate to a new screen or perform other actions.
//         } catch (e) {
//           _showErrorDialog("Login failed. Invalid credentials");
//           // Handle login failure, show an error dialog to the user.
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         shape: const StadiumBorder(),
//         backgroundColor: Colors.greenAccent,
//         elevation: 20,
//         shadowColor: myColor,
//         minimumSize: const Size.fromHeight(60),
//       ),
//       child: const Text("LOGIN"),
//     );
//   }

//   Widget _buildOtherLogin() {
//     return Center(
//       child: Column(
//         children: [
//           _buildGreyText("Or Login with"),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Tab(icon: Image.asset("assets/images/google.png")),
//               Tab(icon: Image.asset("assets/images/facebook.png")),
//               Tab(icon: Image.asset("assets/images/twitter.png")),
//               Tab(icon: Image.asset("assets/images/github.png")),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: LoginPage(),
//     ),
//   );
// }
