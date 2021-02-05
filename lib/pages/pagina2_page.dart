import 'package:estado/models/usuario.dart';
import 'package:estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: false);
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
                  edad: 53,
                  profesiones: ['Una prif','dos frof']
                  );
                usuarioService.usuario= user;

              },),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(usuarioService.usuario.edad+2);
              },),
            MaterialButton(
              child: Text('Añadir profesión', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },),
          ]
        ),
     ),
   );
  }
}