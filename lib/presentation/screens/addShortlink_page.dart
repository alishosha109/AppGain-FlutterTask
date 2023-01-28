import 'package:appgain_flutter_app/business_logic/cubit/short_links_cubit.dart';
import 'package:flutter/material.dart';
import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddShortLinkPage extends StatefulWidget {
  const AddShortLinkPage({Key? key}) : super(key: key);

  @override
  State<AddShortLinkPage> createState() => _AddShortLinkPageState();
}

class _AddShortLinkPageState extends State<AddShortLinkPage> {
  final _formKey = GlobalKey<FormState>();
  var slug;
  var web;
  var ios_primary;
  var ios_fallback;
  var android_primary;
  var android_fallback;

  Widget bloc_child_widget() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  onSaved: (value) {
                    slug = value;
                  },

                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      hintText: "Slug",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.link,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  onSaved: (value) {
                    web = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Web Can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Web",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.link,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  onSaved: (value) {
                    ios_primary = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "IOS Primary Can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "IOS Primary",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.link,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  onSaved: (value) {
                    ios_fallback = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "IOS Fallback Can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "IOS Fallback",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.link,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  onSaved: (value) {
                    android_primary = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Android Primary Can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Android Primary",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.link,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  onSaved: (value) {
                    android_fallback = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Android Fallback Can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Android Fallback",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.link,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        BlocProvider.of<ShortLinksCubit>(context).addlink(
                            slug,
                            web,
                            android_primary,
                            android_fallback,
                            ios_primary,
                            ios_fallback);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: Text("Enter Data"),
                            backgroundColor: Colors.black,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xFFE60023),
                                Color(0xFFE60023),
                              ]),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Center(
                          child: Text(
                        "Add",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18.0),
                      )),
                    )),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildblocWidget() {
    return BlocConsumer<ShortLinksCubit, ShortLinksState>(
        listener: (context, state) async {
      if (state is linkadded) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return bloc_child_widget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          // automaticallyImplyLeading: false,
          title: const Text('AppGain'),
        ),
        body: buildblocWidget());
  }
}
