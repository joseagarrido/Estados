import 'package:estado/bloc/usuario/usuario_cubit.dart';
import 'package:estado/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                final user = new Usuario(
                  nombre:'Jose',
                  edad:53,
                  profesiones:[
                    'unda',
                    'dos'
                  ]
                );
                context.bloc<UsuarioCubit>().seleccionarUsuario(user);
              },),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                context.bloc<UsuarioCubit>().cambiarEdad(30);
              },),
            MaterialButton(
              child: Text('Añadir profesión', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                context.bloc<UsuarioCubit>().agregarProfesion();
              },),
          ]
        ),
     ),
   );
  }
}