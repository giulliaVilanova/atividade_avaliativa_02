import 'package:flutter/material.dart';
import 'apiService.dart';
import 'usuario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  Usuario? usuario;
  String? errorMessage;
  bool isLoading = false;

  Future<void> buscarUsuario() async {
    final String input = _controller.text;
    final int? id = int.tryParse(input);

    setState(() {
      usuario = null;
      errorMessage = null;
      isLoading = true;
    });

    if (id == null || id < 1 || id > 12) {
      setState(() {
        errorMessage = 'Usuário não encontrado!';
        isLoading = false;
      });
      return;
    }

    try {
      final fetchedUser = await ApiService.buscarUsuario(id);
      setState(() {
        if (fetchedUser != null) {
          usuario = fetchedUser;
        } else {
          errorMessage = 'Usuário não encontrado!';
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Erro na requisição!';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividade Avaliativa 02'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Buscar ID (1-12)',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : buscarUsuario,
                child: isLoading
                    ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : Text('Buscar'),
              ),
              SizedBox(height: 20),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )
              else if (usuario != null)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(usuario!.avatar),
                          radius: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      usuario!.nome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      usuario!.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
