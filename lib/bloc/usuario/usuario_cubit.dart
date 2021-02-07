

import 'package:estado/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInicial());

  void seleccionarUsuario (Usuario user){
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad){
    final currentState = state;
    if (currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad:edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(){
    final currentState = state;
    if (currentState is UsuarioActivo){
      List<String>profesiones = currentState.usuario.profesiones;
      profesiones.add('Profesion ${profesiones.length+1}');
      final newUser = currentState.usuario.copyWith(profesiones:profesiones);
      emit(UsuarioActivo(newUser));
    }
  }
  
  
}