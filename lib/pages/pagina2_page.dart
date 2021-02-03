import 'package:estado/models/usuario.dart';
import 'package:estado/pages/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
        stream: usuarioService.usuarioStream ,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
        return snapshot.hasData ?
       Text(snapshot.data.nombre)
      : Text('Pagina2');   
        },
      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                Usuario user =new Usuario(nombre: 'pep', edad: 30);
                usuarioService.cargarUsuario(user);
              },),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(usuarioService.usuario.edad+3);
              },),
            MaterialButton(
              child: Text('Añadir profesión', style: TextStyle(color: Colors.white),) ,
              color: Colors.blue,
              onPressed: () {},),
          ]
        ),
     ),
   );
  }
}