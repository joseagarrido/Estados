import 'package:estado/models/usuario.dart';
import 'package:estado/pages/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream ,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
        return snapshot.hasData ?
      InformacionUsuario(usuario: usuarioService.usuario,)
      : Center(child: Text('Sin usuario'));   
        },
      ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.accessibility),
       onPressed: ()=>Navigator.pushNamed(context, 'pagina2'),
      ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({this.usuario});


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
          ListTile(title: Text('Edad:  ${usuario.edad}')),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),

          ListTile(title: Text('Profesión 1: ')),
          ListTile(title: Text('Profesión 2: ')),
        ],
      ),
    );
  }
}