import 'package:flutter/material.dart';
import 'package:itrash_skripsi/providers/auth_provider.dart';
import 'package:itrash_skripsi/theme.dart';
import 'package:itrash_skripsi/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController phoneController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController alamatController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        alamat: alamatController.text,
      )) {
        AlertDialog alert = AlertDialog(
          title: const Text("Registrasi Berhasil"),
          content: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text("Silahkan Login akun"),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              child: Text(
                'Ok',
                style: primaryTextStyleWht,
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
            ),
          ],
        );

        showDialog(context: context, builder: (context) => alert);
      } else {
        setState(() {
          isLoading = false;
          AlertDialog alert = AlertDialog(
            title: const Text("Registrasi Gagal"),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text("Maaf, Silahkan Coba Kembali"),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                child: Text(
                  'Ok',
                  style: primaryTextStyleWht,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        });
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget imageHeader() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('asset/logo.png'),
                height: 60,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageHeader(),
            // const Image(
            //   image: AssetImage('asset/logo.png'),
            //   height: 40,
            //   fit: BoxFit.contain,
            // ),
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
                color: const Color.fromARGB(255, 251, 249, 249),
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icon_user.png',
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Nama Lengkap Kamu',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    // Widget usernameInput() {
    //   return Container(
    //     margin: const EdgeInsets.only(top: 20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Username',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: backgroundColor2,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: Row(
    //               children: [
    //                 Image.asset(
    //                   'asset/icon.username.png',
    //                   width: 17,
    //                 ),
    //                 const SizedBox(
    //                   width: 16,
    //                 ),
    //                 Expanded(
    //                   child: TextFormField(
    //                     decoration: const InputDecoration(
    //                       hintText: 'Nama Panggilan Kamu',
    //                       hintStyle: TextStyle(color: Colors.black38),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icon_email.png',
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Email Kamu',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget phoneInput() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomer Handphone',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icon_phone.png',
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        decoration: const InputDecoration.collapsed(
                            hintText: '(with code area ex: 628...)'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icon_password.png',
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Password Kamu',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput2() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: alamatController,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Alamat Kamu',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 5, 161, 31),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Register',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, color: Colors.white),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah Punya Akun?',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Sign In',
                style: primaryTextStyle2.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                    color: Colors.greenAccent),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // imageHeader(),
                header(),
                nameInput(),
                // usernameInput(),
                emailInput(),
                phoneInput(),
                passwordInput(),
                passwordInput2(),
                isLoading ? const LoadingButton() : signUpButton(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
