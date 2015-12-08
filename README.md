# Reconocimiento de gestos con Octave
`Germán Paz Méndez`


Este práctica ha sido desarrollada en la asignatura de **Sistemas de Interacción Persona-Computador** del **_Grado en Ingeniería Informática_** de la **ULL**.

## Descripción de la práctica
1. Familiarizarse con algunos comandos básicos de Octave para procesamiento de
imágenes.
2. Implementar la técnica de detección de la mano por diferencias entre imágenes
usando como imágenes de prueba y referencia las proporcionadas por el profesor,
validando la máscara binaria de detección obtenida.
3. Implementar el reconocedor de gestos para estas imágenes, ajustando los valores para
el reconocimiento.
4. Con lo aprendido en los puntos 2 y 3, implementar el reconocedor en tiempo real para
sus propias manos.

### Cuestiones:
##### Apartado 2

1. ¿Qué umbral utilizaste en la detección por diferencias en escala de grises?
> Se ha usado el umbral con un valor de 10.

2. ¿Qué umbral utilizaste en la detección por diferencias en YCbCr?
> Se ha usado el umbral con un valor de 6.

3. ¿Cuál de los dos crees que funciona mejor? ¿Por qué?
> El YCbCr ya que no se ve afectado por la luminosidad del ambiente.

4. ¿Por qué pueden aparecer píxeles de ruido al crear la máscara binaria?
>  Todo dependerá del umbral establecido y de la luz del entorno ya que varía la persepción del color en RGB. En YCbCr no tendremos este problema ya que trabajamos con Cb.  
>
**NOTA:** El nivel de gris de un píxel equivale a su nivel de luminosidad; el resto de la información sobre el color no se tiene en cuenta. Dado que esta comparación de valores se realiza individualmente para cada píxel, al método del valor umbral se le considera un método de segmentación orientado a píxeles.  
>
**NOTA:** El operador **UMBRAL** se define para producir una imagen binaria con sólo dos niveles de gris, 1 (blanco) y 0 (negro).


##### Apartado 3
1. ¿Por qué no funciona el reconocimiento en algunos casos?
> Únicamente establecemos la lógica para un caso concreto. En algunos casos no funcionara por similitudes.

2. ¿Se te ocurre otra forma sencilla para mejorar el reconocimiento? ¿Cuál?
> Podríamos dividir la mano en dos partes para un reconocimiento mejor. Una parte sería la palma de la mano y otra los dedos. A partir de aquí aplicar por tamaño y por relacion pixeles blancos/negros de los dos rectangulos captados.

##### Apartado 4
1. ¿Qué problemas has tenido en la implementación en tiempo real?
> He tenido que modificar el umbral dependiendo de la luz del ambiente.

2. ¿Qué procedimiento has seguido para ajustar el umbral de la detección en tiempo real?
> Lo he modificado manualmente

3. ¿Has encontrado diferencias entre trabajar con las imágenes estáticas y en tiempo real? ¿Cuáles? ¿Por qué?
> La principal diferencia es que ahora trabajamos con un mayor conjunto de datos y variedad y debemos encontrar un similitud genérica para captar los valores.

## Instalación
Tenemos dos opciones:

Usar el octave ppa, el cual ya se encuentra en su versión 4.0:

```
sudo apt-add-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave
```

ó descargar y compilar los códigos fuentes:

```
sudo apt-get build-dep octave
wget ftp://ftp.gnu.org/gnu/octave/octave-4.0.0.tar.gz
tar xf octave-4.0.0.tar.gz
cd octave-4.0.0/
./configure
make
sudo make install
```

## Paquetes necesarios
Descargar el **Image package**: [http://octave.sourceforge.net/image/](http://octave.sourceforge.net/image/ "ref")  

En nuestra **terminal** ejecutaremos lo siguiente:
> sudo apt-get install liboctave-dev   

En **octave** ejecutaremos lo siguiente:
> pkg install image-2.4.1.tar.gz  
> pkg load image

Además deberemos añadir los **VirtualBox 5.0.10 Oracle VM VirtualBox Extension Pack** para el uso de la webCam: [All supported platforms ](http://download.virtualbox.org/virtualbox/5.0.10/Oracle_VM_VirtualBox_Extension_Pack-5.0.10-104061.vbox-extpack "All supported platforms ")

## Ayúdame a mejorar este tutorial

Cada **bugs** que encuentres házmelo saber a [gcpmendez@gmail.com](mailto:gcpmendez@gmail.com)

## Enlaces Externos

  [1]: [ETSII ULL](http://www.ull.es/view/centros/etsii/Tercero_7/es), Escuela Técnica Superior de Ingeniería Informática - Graduado en Ingeniería Informática.  

## Licencia
<a rel="license"  href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>  <br />Este trabajo tiene una licencia <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
