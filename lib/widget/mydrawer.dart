import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/cubit/auth_cubit.dart';

import '../welcome_board.dart';

class MyDrawer extends StatelessWidget {
  final Isar isar;
  const MyDrawer({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    return Drawer(
      width: 320,
      
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverFillRemaining(
            child: Center(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.1),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Profile',
                          style: GoogleFonts.lato(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          selectedImages != null
                              ? CircleAvatar(
                                  radius: 38,
                                  backgroundImage: FileImage(selectedImages!),
                                )
                              : const CircleAvatar(
                                  radius: 30,
                                )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 58,
                      width: 120,
                      color: Colors.grey,
                      child: const Center(child: Text('10 Task Left')),
                    ),
                    Container(
                      height: 58,
                      width: 120,
                      color: Colors.grey,
                      child: const Center(
                        child: Text('5 Task Done'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.5, top: 24),
                  child: Text(
                    'Settings',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Icon(Icons.settings),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'App Settings',
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.29),
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.5, top: 24),
                  child: Text(
                    'Account',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.03),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(Icons.person_sharp),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Change Account Name',
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 50),
                                  child:
                                      const Icon(Icons.arrow_forward_outlined),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.03),
                        child: Row(
                          children: [
                            const Icon(Icons.key),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Account Password',
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 23),
                              child: const Icon(Icons.arrow_forward_outlined),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.03),
                        child: Row(
                          children: [
                            const Icon(Icons.camera_alt_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Account Image',
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.12),
                              child: const Icon(Icons.arrow_forward_outlined),
                            )
                          ],
                        ),
                      ),
                    ),
                    
                                        const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                         context.read<AuthCubit>().logout();
                         
                         Get.offAll(WelcomeBoard(isar: isar));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.03),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_circle_left_outlined,color: Colors.red,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                    


                  
                    
                  ],
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
