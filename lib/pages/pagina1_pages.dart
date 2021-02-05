import 'package:estado/models/usuario.dart';
import 'package:estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: (){
              usuarioService.usuario != null
               ? usuarioService.eliminarUsuario()
               : null;
              //quitar usuario
            })
        ],
      ),
      body: usuarioService.existeUsuario 
       ? InformacionUsuario(usuario: usuarioService.usuario)
       : Center(child: Text('Sin información de usuario')),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.accessibility),
       onPressed: ()=>Navigator.pushNamed(context, 'pagina2'),
      ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({ this.usuario}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: double.infinity,
      padding:  EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre} ')),
          ListTile(title: Text('Edad: ${usuario.edad}')),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion),)).toList()
          //ListTile(title: Text('Profesión 1: ')),
          
        ],
      ),
    );
  }
}