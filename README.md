# Matrix Rotation App

Este proyecto de Flutter implementa una aplicación que permite a los usuarios interactuar con matrices numéricas y rotarlas en sentido antihorario. Utiliza el paquete `flutter_riverpod` junto con `riverpod_generator` para la gestión eficiente del estado y la inyección de dependencias. Además, emplea `fvm` para manejar la versión de Flutter utilizada, garantizando consistencia en el entorno de desarrollo.

## Características

- Visualización de matrices numéricas en forma de cuadrícula.
- Rotación de matrices en sentido antihorario mediante una interfaz de usuario intuitiva.
- Uso de toasts nativos para mostrar el estado anterior de la matriz antes de su rotación.

## Tecnologías Utilizadas

- [Flutter](https://flutter.dev/) manejado por [FVM (Flutter Version Management)](https://fvm.app/)
- [Riverpod](https://riverpod.dev/)
- Toasts nativos mediante canales de plataforma específicos para Android y iOS.

## Estructura del Proyecto

- `lib/`: Contiene los archivos Dart del proyecto.
  - `main.dart`: Punto de entrada de la aplicación Flutter.
  - `matrix_provider.dart`: Define la lógica de negocio para manejar el estado de la matriz.
- `android/`: Código específico de Android, incluyendo la implementación de toasts nativos.
- `ios/`: Código específico de iOS para toasts nativos.

## Requisitos Previos

Para ejecutar este proyecto, necesitarás tener instalado Flutter a través de FVM en tu entorno de desarrollo. Sigue las instrucciones en [FVM Documentation](https://fvm.app/docs/getting_started/overview) para instalar FVM y configurar la versión de Flutter recomendada para este proyecto.

## Configuración del Proyecto

1. Clona este repositorio en tu máquina local:

```sh
git clone https://github.com/EdHuamani/flutter_matrix_app.git
cd flutter_matrix_app
```

2. Asegúrate de estar usando la versión correcta de Flutter a través de FVM:

```sh
fvm use stable
```

3. Instala las dependencias del proyecto:

```sh
fvm flutter pub get
```

4. Ejecuta el generador de código para Riverpod:

```sh
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Ejecución de la Aplicación

Para ejecutar la aplicación en un emulador o dispositivo conectado, utiliza FVM para asegurar el uso de la versión correcta de Flutter:

```sh
fvm flutter run
```
