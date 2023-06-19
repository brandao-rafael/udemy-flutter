import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endsWithFile;
  }

  void updateImage() {
    setState(() {});
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();

    Provider.of<ProductList>(
      context,
      listen: false,
    ).saveProduct(_formData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (newValue) => _formData['name'] = newValue ?? '',
                // ignore: no_leading_underscores_for_local_identifiers
                validator: (_name) {
                  final name = _name ?? '';
                  if (name.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  if (name.trim().length < 3) {
                    return 'Nome precisa ter pelo menos 3 letras';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSaved: (newValue) =>
                    _formData['price'] = double.parse(newValue ?? '0'),
                validator: (_price) {
                  final priceString = _price ?? '';
                  final price = double.tryParse(priceString) ?? -1;
                  if (price <= 0) {
                    return 'Informe um preço válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (newValue) =>
                    _formData['description'] = newValue ?? '',
                validator: (_description) {
                  final description = _description ?? '';
                  if (description.trim().isEmpty) {
                    return 'Nome é obrigatória';
                  }
                  if (description.split(' ').length < 3) {
                    return 'Descrição precisa ter pelo menos 3 palavras';
                  }

                  if (description.trim().length < 10) {
                    return 'Descrição precisa ter pelo menos 10 letras';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Url da Imagen'),
                      focusNode: _imageUrlFocus,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (newValue) =>
                          _formData['imageUrl'] = newValue ?? '',
                      validator: (_imageUrl) {
                        final imageUrl = _imageUrl ?? '';
                        if (!isValidImageUrl(imageUrl)) {
                          return 'Informe uma Url válida';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsetsDirectional.only(
                      top: 10,
                      start: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: _imageUrlController.text.trim().isEmpty
                          ? const Text('Informe a URL')
                          : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(_imageUrlController.text),
                            ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
