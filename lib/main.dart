import 'package:flutter/material.dart';


void main() {
  runApp(const App());
}



class App extends StatelessWidget{
  const App({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App',
      home: Homepage(),
    );
  }
}




class Homepage extends StatelessWidget{
  const Homepage ({Key? key}):super(key: key);

  Mysnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }



  
  



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Photo Gallery'),
        actions: [
          IconButton(onPressed: (){Mysnackbar("Profile", context);}, icon: Icon(Icons.person))
        ],
      ),






      floatingActionButton: FloatingActionButton(
        elevation:10 ,
        child: Icon(Icons.cloud_upload_rounded),
        backgroundColor: Colors.deepOrangeAccent,

        onPressed: (){
          Mysnackbar("Photos Uploded Successfully!", context);
        },
      ),



      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Welcome to my Photo Gallery",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'search',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 3)
                  ),
                ),
              ),
            ),
            
            
            Wrap(
              spacing: 10,
              children: [
                MyElevatedButton(1),
                MyElevatedButton(2),
                MyElevatedButton(3),
                MyElevatedButton(4),
                MyElevatedButton(5),
                MyElevatedButton(6),

              ],
            ),

            ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Sample Photo 1"),
                  subtitle: Text("Category 1"),
                  onTap: (){
                    Mysnackbar("Sample Photo 1", context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Sample Photo 2"),
                  subtitle: Text("Category 2"),
                  onTap: (){
                    Mysnackbar("Sample Photo 2", context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Sample Photo 3"),
                  subtitle: Text("Category 3"),
                  onTap: (){
                    Mysnackbar("Sample Photo 3", context);
                  },
                ),
              ],
            )

          ],
        ),


      ),

    );
  }
}




class MyElevatedButton extends StatelessWidget {
  final int photoNumber;

  MyElevatedButton(this.photoNumber);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showSnackBar(context, 'Clicked on photo');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Stack(
        children: [
          Image.network(
            'https://th.bing.com/th/id/R.a05fcc004bd0ad1f621cb53887f7462a?rik=Ksc%2fQR1DMTbi1g&riu=http%3a%2f%2fweknowyourdreams.com%2fimages%2fmango%2fmango-06.jpg&ehk=udqszpIkg%2bEQ%2bxBQrSbmrQqMtrgrWJUPimLzBIx1VG8%3d&risl=&pid=ImgRaw&r=0',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          Positioned(
            bottom: 0,
            left: 30,
            right: 30,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.black54,
              child: Text(
                'Mango',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
