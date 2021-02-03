
import 'dart:async';

import 'package:estado/models/usuario.dart';

class _UsuarioService {

  Usuario _usuario;
  StreamController<Usuario> _usuarioStream = new StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStream.stream;

  Usuario get usuario => this._usuario;

  bool get existeUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario (Usuario user) {
    this._usuario=user;
    this._usuarioStream.add(user);
  }

  void cambiarEdad (int edad) {
    this._usuario.edad = edad;
    this._usuarioStream.add(this._usuario);
  }
  
}

final usuarioService = new _UsuarioService();