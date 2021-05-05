import 'package:flutter/material.dart';
import 'package:http/http.dart' show get; //only importing the get function

import 'dart:convert';

void main() {
  runApp(App());
}

//way to kep track of what dog breed user is on
var currentPage = '';

//List of all the urls and images
//going to set to to empty when the user changes dog breeds
//so it should stop showing the other dog breed it was showing
List<ImageModel> images = [];

//make a class that builds a list and adds an image from a specific dog url to a list
class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Image.network(image.url),
          ),
          Text(image.url),
        ],
      ),
    );
  }
}

class ImageModel {
  String url;

  // Constructor
  ImageModel(this.url);

  // Named Constructor
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    url = parsedJson['message'];
  }
}

//* Stateful Widget for the app state

// Widget
class App extends StatefulWidget {
  @override
  AppState createState() {
    return AppState();
  }
}

// Widget State
class AppState extends State<App> {
  // instance variable that's going to change over time

//lots of if statements to check what dog breed the user selected
//possible set up a map to pair dog names with urls in the future?

  void fetchImage() async {
    var response =
        await get('https://dog.ceo/api/breed/affenpinscher/images/random');

    if (currentPage == 'Affenpinscher') {
      response =
          await get('https://dog.ceo/api/breed/affenpinscher/images/random/');
    }
    if (currentPage == 'Beagle') {
      response = await get('https://dog.ceo/api/breed/beagle/images/random/');
    }
    if (currentPage == 'Chihuahua') {
      response =
          await get('https://dog.ceo/api/breed/chihuahua/images/random/');
    }
    if (currentPage == 'Doberman') {
      response = await get('https://dog.ceo/api/breed/doberman/images/random/');
    }
    if (currentPage == 'Dalmatian') {
      response =
          await get('https://dog.ceo/api/breed/dalmatian/images/random/');
    }
    if (currentPage == 'Newfoundland') {
      response =
          await get('https://dog.ceo/api/breed/newfoundland/images/random/');
    }
    if (currentPage == 'Shiba') {
      response = await get('https://dog.ceo/api/breed/shiba/images/random/');
    }
    if (currentPage == 'Samoyed') {
      response = await get('https://dog.ceo/api/breed/samoyed/images/random/');
    }
    if (currentPage == 'Westie') {
      response = await get(
          'https://dog.ceo/api/breed/terrier/westhighland/images/random/');
    }
    if (currentPage == 'Whippet') {
      response = await get('https://dog.ceo/api/breed/whippet/images/random/');
    }
    //set a random page for the extra feature
    if (currentPage == 'Random') {
      response = await get('https://dog.ceo/api/breeds/image/random');
    }

    final imageModel = ImageModel.fromJson(json.decode(response.body));

    //Causing UI to re-render with setState()
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(contex) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            'Pick a dog in the menu and add images with the + button',
            style: TextStyle(fontSize: 12.7),
          ),
        ),
        drawer: navigationDrawer(),
      ),
    );
  }
}

//Lots of buttons for the menu that allows the user to select a dog breed
//probably no the best way to so this

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.cyan,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Affenpinscher'),
                  onPressed: () {
                    currentPage = 'Affenpinscher';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Beagle'),
                  onPressed: () {
                    currentPage = 'Beagle';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Chihuahua'),
                  onPressed: () {
                    currentPage = 'Chihuahua';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Doberman'),
                  onPressed: () {
                    currentPage = 'Doberman';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Dalmatian'),
                  onPressed: () {
                    currentPage = 'Dalmatian';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Newfoundland'),
                  onPressed: () {
                    currentPage = 'Newfoundland';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Shiba'),
                  onPressed: () {
                    currentPage = 'Shiba';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Samoyed'),
                  onPressed: () {
                    currentPage = 'Samoyed';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Westhighland Terrier'),
                  onPressed: () {
                    currentPage = 'Westie';
                    images = [];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Whippet'),
                  onPressed: () {
                    currentPage = 'Whippet';
                    images = [];
                  },
                ),
              ),
            ),
            //Adding my extra feature in the form of a button that gets a random dog image
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: OutlineButton(
                  child: Text('Random Dog'),
                  onPressed: () {
                    currentPage = 'Random';
                    images = [];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
