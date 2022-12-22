import 'package:flutter/material.dart';

import '../../common/loading.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override

  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final _formKey = GlobalKey<FormState>();
  String error ='';
  bool loading = false;
//champ de texte et champ de saisie
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
//Switcher entre le register et le signIn
  void toggleView(){
    setState(() {
      emailController.text='';
      passwordController.text='';
      showSignIn = !showSignIn;
    });

  }
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0.0,
          title: Text(showSignIn
              ? 'Sign in to water Social'
              : 'Register to water social'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(showSignIn ? 'Register' : "Sign In",
                  style: TextStyle(color: Colors.white)),
              onPressed: () => toggleView(),
            )
          ],
        ),

        body: Container(
         // mainAxisAlignment: MainAxisAlignment.center,

          color: Colors.white,
             margin: EdgeInsets.symmetric(vertical: 75.0, horizontal: 50.0),
            padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 50.0),

            child: Form(
                key: _formKey,
                child:
                Container (
                  child: Column(
                    children: [
                      Center(
                        child: Text('Connexion',
                        style: Theme.of(context).textTheme.titleLarge)

                      ),
                      SizedBox(height: 50.0),

                      TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: 'prenom.nom@ynov.fr',
                              border: OutlineInputBorder()),


                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,

                          decoration: const InputDecoration(
                              hintText: 'Mot de passe',
                              border: OutlineInputBorder()
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        style: (
                          co
                        ),
                        child: Text(
                            showSignIn ? "Se Connecter" : "Connexion",
                            style: TextStyle(color: Colors.white),


                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            setState(() => loading = true);
                            var password = passwordController.value.text;
                            var email = emailController.value.text;
                            dynamic result = null;

                            if (result == null) {
                              setState(() {
                                loading= false;
                                error = 'Mettre un email valide';
                              });
                            }
                          }
                        },
                      )

                    ],
                  ),
                )
            ),

        ),
    );
  }
}
