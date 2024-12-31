# Estrutura Dart e suas ligações

**Cenário:** Imagine um aplicativo simples que lista produtos. Este exemplo será um bom ponto de partida para projetos mais complexos.

**Estrutura do Projeto (Pastas):**

`meu_app/
├── lib/
│   ├── core/
│   │   ├── errors/
│   │   │   └── failures.dart
│   │   ├── usecases/
│   │   │   └── usecase.dart
│   │   └── network/
│   │       └── network_info.dart
│   ├── features/
│   │   └── product/
│   │       ├── data/
│   │       │   ├── datasources/
│   │       │   │   ├── product_local_data_source.dart
│   │       │   │   └── product_remote_data_source.dart
│   │       │   ├── models/
│   │       │   │   └── product_model.dart
│   │       │   ├── repositories/
│   │       │   │   └── product_repository_impl.dart
│   │       │   └── repositories/
│   │       │       └── product_repository.dart
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── product.dart
│   │       │   ├── usecases/
│   │       │   │   └── get_products.dart
│   │       │   └── repositories/
│   │       │       └── product_repository.dart
│   │       └── presentation/
│   │           ├── blocs/
│   │           │   └── product_bloc.dart
│   │           ├── pages/
│   │           │   └── product_page.dart
│   │           └── widgets/
│   │               └── product_list.dart
│   └── main.dart`

**content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).

**Explicação Detalhada de Cada Camada e Seus Arquivos:**

**1. lib/core (Núcleo):**

- **errors/failures.dart:**
    - **Responsabilidade:** Define classes para erros genéricos (falhas) que podem ocorrer em todo o aplicativo, como falhas de rede, falhas de cache, etc.
    - **Exemplo:**
        
        `abstract class Failure {
          final String message;
        
          Failure(this.message);
        }
        
        class ServerFailure extends Failure {
          ServerFailure(String message) : super(message);
        }
        
        class CacheFailure extends Failure {
          CacheFailure(String message) : super(message);
        }
        
        // outros failures`
        
        **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
        
    - **Importância:** Permite padronizar o tratamento de erros em todo o aplicativo.
- **usecases/usecase.dart:**
    - **Responsabilidade:** Define uma interface genérica para casos de uso.
    - **Exemplo:**
        
        `import 'package:dartz/dartz.dart';
        
        import '../errors/failures.dart';
        
        abstract class UseCase<Type, Params> {
          Future<Either<Failure, Type>> call(Params params);
        }`
        
        **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
        
    - **Importância:** Garante uma estrutura consistente para casos de uso (a lógica principal do aplicativo) e separa a lógica da implementação.
- **network/network_info.dart:**
    - **Responsabilidade:** Abstrai a verificação de conectividade de rede.
    - **Exemplo:**
        
        `abstract class NetworkInfo {
          Future<bool> get isConnected;
        }
        
        // Implementação para verificação de rede`
        
        **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
        
    - **Importância:** Isola a lógica de verificação da conexão, permitindo fácil mudança de implementação (ex: para testes).

**2. lib/features/product (Feature: Produto):**

- **data (Camada de Dados):**
    - **datasources (Fontes de Dados):**
        - **product_local_data_source.dart:**
            - **Responsabilidade:** Lida com a busca e armazenamento de dados de produtos em cache (local).
            - **Exemplo:**
                
                `abstract class ProductLocalDataSource {
                  Future<List<ProductModel>> getCachedProducts();
                  Future<void> cacheProducts(List<ProductModel> products);
                }
                // Implementação com SharedPreferences, Hive, etc.`
                
                **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
                
            - **Importância:** Abstrai a implementação de cache de dados.
        - **product_remote_data_source.dart:**
            - **Responsabilidade:** Lida com a busca de dados de produtos de uma API (servidor).
            - **Exemplo:**
                
                `import '../models/product_model.dart';
                
                abstract class ProductRemoteDataSource {
                  Future<List<ProductModel>> getProductsFromApi();
                }
                // Implementação com http package ou Dio`
                
                **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
                
            - **Importância:** Abstrai a comunicação com a API.
    - **models/product_model.dart:**
        - **Responsabilidade:** Define um modelo de dados específico para a camada de dados (pode ser diferente da entidade de domínio).
        - **Exemplo:**
            
            `class ProductModel {
              final int id;
              final String name;
              final double price;
            
              ProductModel({required this.id, required this.name, required this.price});
            
              factory ProductModel.fromJson(Map<String, dynamic> json) {
                 return ProductModel(
                     id: json['id'] as int,
                     name: json['name'] as String,
                     price: (json['price'] as num).toDouble(),
                  );
              }
            
             // Implementação para converter do modelo para o domínio (Product)
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Garante a separação da camada de dados da camada de domínio.
    - **repositories/product_repository_impl.dart:**
        - **Responsabilidade:** Implementa a interface do repositório, orquestrando as fontes de dados.
        - **Exemplo:**
            
            `import 'package:dartz/dartz.dart';
            
            import '../../domain/entities/product.dart';
            import '../../domain/repositories/product_repository.dart';
            import '../datasources/product_local_data_source.dart';
            import '../datasources/product_remote_data_source.dart';
            import '../models/product_model.dart';
            
            import '../../../core/errors/failures.dart';
            
            class ProductRepositoryImpl implements ProductRepository {
              final ProductRemoteDataSource remoteDataSource;
              final ProductLocalDataSource localDataSource;
            
              ProductRepositoryImpl({required this.remoteDataSource, required this.localDataSource});
            
             @override
              Future<Either<Failure, List<Product>>> getProducts() async {
                try {
                  final remoteProducts = await remoteDataSource.getProductsFromApi();
                   localDataSource.cacheProducts(remoteProducts);
                  return Right(_productListModelToEntity(remoteProducts));
                }  catch (e){
                  return  Left(ServerFailure("erro"));
                }
            
              }
              List<Product> _productListModelToEntity(List<ProductModel> list){
                  return list.map((productModel) => Product(id: productModel.id, name: productModel.name, price: productModel.price)).toList();
              }
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Centraliza a lógica de obtenção de dados (da API ou cache).
    - **repositories/product_repository.dart:**
        - **Responsabilidade:** Define a interface do repositório, que será utilizada pela camada de domínio.
        - **Exemplo:**
            
            `import 'package:dartz/dartz.dart';
            
            import '../../domain/entities/product.dart';
            import '../../../core/errors/failures.dart';
            abstract class ProductRepository {
              Future<Either<Failure, List<Product>>> getProducts();
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Abstrai a implementação da obtenção de dados da camada de domínio.
- **domain (Camada de Domínio):**
    - **entities/product.dart:**
        - **Responsabilidade:** Define a entidade de domínio (modelo de dados puro, sem dependências).
        - **Exemplo:**
            
            `class Product {
              final int id;
              final String name;
              final double price;
            
              Product({required this.id, required this.name, required this.price});
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Representa o objeto de negócio central da feature.
    - **usecases/get_products.dart:**
        - **Responsabilidade:** Implementa um caso de uso específico, que utiliza o repositório.
        - **Exemplo:**
            
            `import 'package:dartz/dartz.dart';
            
            import '../../../core/errors/failures.dart';
            import '../../../core/usecases/usecase.dart';
            import '../entities/product.dart';
            import '../repositories/product_repository.dart';
            
            class GetProducts implements UseCase<List<Product>, NoParams> {
              final ProductRepository repository;
              GetProducts(this.repository);
            
              @override
              Future<Either<Failure, List<Product>>> call(NoParams params) async {
                return await repository.getProducts();
              }
            }
            
            class NoParams {}`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Define a lógica de negócio (obter produtos) de forma independente.
    - **repositories/product_repository.dart:** (Repetido aqui para manter a separação de responsabilidade)
        - **Responsabilidade:** Define a interface do repositório na camada de domínio, o que garante que a camada de domínio não conheça a implementação da camada de dados.
        - **Exemplo:**
            
            ```dart
            
            import 'package:dartz/dartz.dart';
            
            import '../entities/product.dart';
            
            import '../../../core/errors/failures.dart';
            
            `abstract class ProductRepository {
                Future<Either<Failure, List<Product>>> getProducts();
            }
            ````
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).
            
- **presentation (Camada de Apresentação):**
    - **blocs/product_bloc.dart:**
        - **Responsabilidade:** Lida com a lógica da apresentação, manipulando eventos e atualizando o estado da UI.
        - **Exemplo:**
            
            `import 'package:flutter_bloc/flutter_bloc.dart';
            
            import '../../domain/entities/product.dart';
            import '../../domain/usecases/get_products.dart';
            import 'product_event.dart';
            import 'product_state.dart';
            
            class ProductBloc extends Bloc<ProductEvent, ProductState> {
              final GetProducts getProducts;
            
              ProductBloc({required this.getProducts}) : super(ProductInitial()) {
                on<FetchProducts>(_onFetchProducts);
              }
            
              void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
                emit(ProductLoading());
                final failureOrProducts = await getProducts(NoParams());
                 failureOrProducts.fold(
                       (failure) => emit(ProductError(message: failure.message)),
                      (products) => emit(ProductLoaded(products: products)),
                 );
              }
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Separa a lógica da apresentação da UI, facilitando testes.
        - **product_event.dart:**
            - **Responsabilidade:** Define os eventos que o ProductBloc irá processar.
                
                `abstract class ProductEvent{}
                
                 class FetchProducts extends ProductEvent{}`
                
                **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
                
        - **product_state.dart:**
            - **Responsabilidade:** Define os estados que a UI pode assumir.
            
            `import '../../domain/entities/product.dart';
            
            abstract class ProductState{}
            
             class ProductInitial extends ProductState{}
            
             class ProductLoading extends ProductState{}
            
             class ProductLoaded extends ProductState{
             final List<Product> products;
             ProductLoaded({required this.products});
             }
            
             class ProductError extends ProductState{
             final String message;
             ProductError({required this.message});
             }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
    - **pages/product_page.dart:**
        - **Responsabilidade:** Constrói a tela principal, conectando o bloc e exibindo widgets.
        - **Exemplo:**
            
            `import 'package:flutter/material.dart';
            import 'package:flutter_bloc/flutter_bloc.dart';
            
            import '../blocs/product_bloc.dart';
            import '../blocs/product_event.dart';
            import '../blocs/product_state.dart';
            import '../widgets/product_list.dart';
            
            class ProductPage extends StatefulWidget {
             const ProductPage({Key? key}) : super(key: key);
            
              @override
              State<ProductPage> createState() => _ProductPageState();
            }
            
            class _ProductPageState extends State<ProductPage> {
            @override
                void initState() {
                super.initState();
                context.read<ProductBloc>().add(FetchProducts());
            }
            
             @override
              Widget build(BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Products')),
                  body: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProductLoaded) {
                        return ProductList(products: state.products);
                      } else if(state is ProductError){
                           return Center(child: Text(state.message),);
                      }
                        return const Center(child: Text("Ocorreu um erro"));
                    },
                  ),
                );
              }
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Responsável pela interface do usuário e a ligação com o bloc.
    - **widgets/product_list.dart:**
        - **Responsabilidade:** Exibe uma lista de produtos.
        - **Exemplo:**
            
            `import 'package:flutter/material.dart';
            
            import '../../domain/entities/product.dart';
            
            class ProductList extends StatelessWidget {
              final List<Product> products;
            
              ProductList({required this.products});
            
              @override
              Widget build(BuildContext context) {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    );
                  },
                );
              }
            }`
            
            **content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart
            
        - **Importância:** Componente reutilizável para exibir produtos.

**3. lib/main.dart (Ponto de Entrada):**

- **Responsabilidade:** Inicializa o aplicativo, configura dependências e define a tela inicial.
- **Exemplo:**

`import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/product/data/datasources/product_local_data_source.dart';
import 'features/product/data/datasources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/get_products.dart';
import 'features/product/presentation/blocs/product_bloc.dart';
import 'features/product/presentation/pages/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final http.Client client = http.Client();
    late final ProductRepository productRepository = ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(client: client),
      localDataSource:  ProductLocalDataSourceImpl(),
   );
     late final getProductsUseCase = GetProducts(productRepository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Product App',
        theme: ThemeData(primarySwatch: Colors.blue),
       home:  BlocProvider(
          create: (context) => ProductBloc(getProducts: getProductsUseCase),
          child: const ProductPage(),
        ),
    );
  }
}`

**content_copydownload**Use code [**with caution**](https://support.google.com/legal/answer/13505487).Dart

**Explicação da Ligação e Responsabilidades:**

1. **main.dart:**
    - Inicializa o app e seus blocos, injetando as dependências necessárias.
    - Define o ProductPage como a tela inicial.
2. **ProductPage:**
    - Usa o BlocProvider para fornecer o ProductBloc à sua árvore de widgets.
    - Despacha o evento FetchProducts para o ProductBloc para solicitar os produtos.
    - Utiliza o BlocBuilder para reconstruir a UI com base no estado do ProductBloc.
3. **ProductBloc:**
    - Recebe o evento FetchProducts.
    - Chama o caso de uso GetProducts para obter os produtos.
    - Emite o estado ProductLoading, ProductLoaded ou ProductError, dependendo do resultado.
4. **GetProducts:**
    - Utiliza o ProductRepository para obter os produtos (orquestrando as fontes de dados).
5. **ProductRepositoryImpl:**
    - Implementa a interface ProductRepository.
    - Decide se busca dados na API (ProductRemoteDataSource) ou no cache (ProductLocalDataSource).
6. **ProductRemoteDataSource e ProductLocalDataSource:**
    - Lidam com as fontes de dados específicas (API e cache, respectivamente).
7. **Camada core:**
    - NetworkInfo: Responsável por verificar a conexão com a rede.
    - Failures: Responsável por tratar os erros e dar um feedback amigável ao usuário.
    - UseCase: Permite que a lógica da aplicação esteja desacoplada da UI.

**Benefícios da Clean Architecture:**

- **Separation of Concerns:** Cada camada tem uma responsabilidade bem definida.
- **Testability:** Facilita a criação de testes unitários e de integração para cada camada.
- **Maintainability:** O código fica mais fácil de entender, modificar e adicionar novas funcionalidades.
- **Adaptability:** Permite substituir partes do código (ex: um tipo de banco de dados) com mínimo impacto no resto do app.
- **Reusabilidade:** Código da camada de domínio é reutilizável e livre de dependências de framework.

**Considerações:**

- Este é um exemplo simplificado, que pode ser expandido para lidar com mais casos de uso, erros e complexidade.
- Você pode escolher usar bloc, provider ou qualquer outra solução de gerenciamento de estado.
- A estrutura das pastas pode variar um pouco, mas o importante é manter a separação de responsabilidades.

Espero que esta explicação detalhada e este exemplo prático ajudem você a entender como aplicar a Clean Architecture em seus projetos Flutter com Dart. Se tiver alguma dúvida, é só perguntar!
