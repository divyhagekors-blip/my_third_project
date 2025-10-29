import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providedata/Dataprovider.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod demo"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextField(
              onChanged: (value){
                ref.read(dataprovider.notifier).textfield(value);
              },
            ),
          ),
          Consumer(builder: (context, ref, child){
            final textfielddata = ref.watch(dataprovider.select((state)=> state.search));
            print("textfield");
            return Text(textfielddata);
          }),



          Consumer(builder: (context,ref,child){
            print("slider");
            final sliderdata = ref.watch(dataprovider.select((state)=> state.slider));
            return Container(
              height: 200,
              width: 200,
              color: Colors.red.withOpacity(sliderdata),
            );
          }),

          Consumer(builder: (context, ref, child){
            final sliderdata = ref.watch(dataprovider.select((state)=> state.slider));
            return Slider(value:  sliderdata,
                onChanged: (value){
                  ref.read(dataprovider.notifier).sliderdata(value);
                });
          }),


           Consumer(builder: (context, ref, child){
             print("only switch is work");
             final switchdata = ref.watch(dataprovider.select((state) => state.Switch));
             return Switch(
                 value: switchdata,
                 onChanged: (value){
                   ref.read(dataprovider.notifier).switchprovider(value);
                 });
           }),



          Consumer(builder: (context, ref, child){
            final counterdata = ref.watch(dataprovider.select((state)=> state.counter));
            return Text(counterdata.toString());
          }),

          ElevatedButton(
              onPressed: (){
                ref.read(dataprovider.notifier).counterdata(0);
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
