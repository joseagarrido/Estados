import 'package:estado/bloc/usuario/usuario_cubit.dart';
import 'package:estado/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      body: BodyScaffold() ,
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.accessibility),
       onPressed: ()=>Navigator.pushNamed(context, 'pagina2'),
      ),
   );
  }
}

class BodyScaffold extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit,UsuarioState> (
      builder: (_, state) {
        if (state is UsuarioInicial) {
          return Center(child: Text('No hay información del usuario'));
        } else { if (state is UsuarioActivo) 

           return InformacionUsuario(usuario: state.usuario);
        }
       

      },);
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
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),

          ...usuario.profesiones.map(
            (profesion) => ListTile(title:Text(profesion))
            ).toList()

        ],
      ),
    );
  }
}