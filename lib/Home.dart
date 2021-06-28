import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
 @override
  _TodoPageState createState() => _TodoPageState();
} 

class _TodoPageState extends State<TodoPage> {

	var output = "" ;

  List<dynamic> listt = ["1","2","3","4","5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,

        brightness: Brightness.dark,
       
        title: Center(child: Text("TODO App")) ,

        
        
        
        ),
      
      
      body: 
          ListView.builder(itemCount: listt.length ,  itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(top:8),
              height: MediaQuery.of(context).size.height/10,
              color: Colors.cyan,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal:6) ,
				 
          leading:  Padding(
				    padding: const EdgeInsets.only(top:7),
				    child: Icon(Icons.circle , size: 12 ,color: Colors.black ),
				  ),
               
                title: Text(listt[index]) ,
                
               trailing: PopupMenuButton(
                  
                 color: Colors.grey[700],
                 itemBuilder: (context) => [
                   
                    PopupMenuItem( 
                     
                      height: 1,
                      value: 0,
                      child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   elevation: 0,
                   primary: Colors.transparent,
                   onPrimary: Colors.black,

                   


                 ),
                  onPressed: (){
                    Navigator.pop(context);
                    showDialog(context: context, builder: (context){
                       return AlertDialog(
                          backgroundColor: Colors.blueGrey[100],
                        title: Text("Are You Sure?"),
                        
                        content: Text("This will delete it permanently."),
                        
                        actions: [

                          FlatButton(

                            textColor: Colors.cyan,
                            onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancel")),

                         FlatButton(
                           padding: EdgeInsets.only(right:15),
                          splashColor: Colors.grey,
                          textColor: Colors.cyan,
                            onPressed: (){
                         Navigator.pop(context);
                          setState(() {
                            listt.removeAt(index);
                          });
                            }, child: Text("Delete")),
                          ],
                        );
                    });
                    }, 
                          child: Text("Delete"),)
                    ),

                    
                    PopupMenuItem( 
                      value: 2,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           alignment: Alignment.topLeft,
                           primary: Colors.transparent,
                           onPrimary: Colors.black,
                           elevation: 0,

                         ),
                         onPressed: (){
                             Navigator.pop(context);
                           showDialog(context: context, builder: (contect){
                             return AlertDialog(
                                 backgroundColor: Colors.blueGrey[200],
                               title: Text("Edit") ,
                               content: TextField(
                                 onChanged: (value){
                                   output = value ;
                                 }
                               ),

                                actions: [
                                    
                                    FlatButton(
                                        textColor: Colors.cyan,
                                        onPressed: () {
                                        Navigator.pop(context);
                                    }, child: Text("Cancel")),

                                    FlatButton(
                                        textColor: Colors.cyan,
                                        onPressed: (){
                                        Navigator.pop(context);
                                        setState(() {
                                          listt.replaceRange(index, index+1 , {output});
                                        });
                                    }, child: Text("Save")),
                                ],

                             );
                           });
                        }, 
                       child: Text("Edit")), 
                       )
                 ] ,
                 
                 ) ,
              
              
              
              
              
              
              
              
              
              
              
              
              ),
            );
          }
          ),

		  floatingActionButton: FloatingActionButton(
			  backgroundColor: Colors.black,
			  elevation: 10,
			  // foregroundColor: Colors.cyan,
			  hoverColor: Colors.pink,
			  splashColor: Colors.cyan,
			//   shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0) ),
			  
			  onPressed: (){
			 showDialog(context: context, builder: (context){
				return AlertDialog(

          elevation: 8,
          backgroundColor: Colors.blueGrey[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
          // buttonPadding: EdgeInsets.only(right: 16),
          // actionsOverflowDirection: true,
					title: Text("Alert Dialog Testing"),
					content: TextField(
						onChanged : (value){
							output = value ;
						}
					),

					actions: [

            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.only(right: 0) ,onPrimary: Colors.black ,primary: Colors.transparent, shadowColor: Colors.transparent),
              onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel")),


            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  // margin: EdgeInsets.only(right: 10) ,
                ),
                onPressed: (){
							Navigator.pop(context);

							setState(() {
							  listt.add(output);
							});
						}, child: Center(child: Text("Submit"))),
            ),
					],
					
				);
			 }
			 );
			
		  },
		  child: Icon(Icons.add, size: 28,),
		  
		  
		  ),

       

	

    );
  }
}