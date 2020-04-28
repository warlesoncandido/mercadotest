import 'package:flutter/material.dart';
import 'package:mercado_pago/mercado_pago.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MercadoCredentials _mercadoCredentials = MercadoCredentials(
    publicKey: 'TEST-499c7eb1-d6c3-4649-8fa0-43aab70dfdb4',
    accessToken: 'TEST-3715643755593532-052920-2696047feaaf6c6714a9034a3533e75d-123702081'
  );


//NEW USER
  Future<MercadoObject> newUser()async{
    MercadoPago mp = MercadoPago(_mercadoCredentials);
    MercadoObject retorno = await mp.newUser(
      firstname: 'Diego ',
      lastName: 'Mariano',
      email: 'diegoddl@hotmail.com',
      documentType: 'DNI',
      documentNumber: '12345678'
    );
    print(retorno);
    return retorno;
  }

//NEW CARD
Future<MercadoObject> newCard()async{
  MercadoPago mp = MercadoPago(_mercadoCredentials);
  MercadoObject retorno = await mp.newCard(
    code: '320',
    year: '2025',
    month: 1,
    card: '5031433215406351',
    documentType: '',
    documentNumber: '',
    fullName: 'APRO'
  );
  print(retorno);
  return retorno;
}

//ASSOCIATE USER IN CARD
Future<MercadoObject> associateCardUser()async{
  MercadoPago mp = MercadoPago(_mercadoCredentials);
  MercadoObject retorno = await mp.associateCardWithUser(
    user: '556061515-XIsJnPzEK69YCj',
    card: 'a3660d1bbb32f19a355f174128a23950'
  );
  print(retorno);
  return retorno;
}

//TOKEN CARD
Future<MercadoObject> tokenCard()async{
  MercadoPago mp = MercadoPago(_mercadoCredentials);
  MercadoObject retorno = await mp.tokenWithCard(
    code: '320',
    card: '5031433215406351'
  );
  print(retorno);
  return retorno;
}


//NEW PAYMENT
Future<MercadoObject> newPayment()async{
  MercadoPago mp = MercadoPago(_mercadoCredentials);
  MercadoObject retorno = await mp.createPayment(
    total: 4.90,
    cardToken: '8e3302c2d06ded1ff8dc645c5016cb37', 
    description: 'payment test',
    paymentMethod: 'master',
    userId: '556061515-XIsJnPzEK69YCj',
    email: 'diego@hotmail.com'
  );
  print(retorno);
  return retorno;
}


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    newPayment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
