% Creamos una nueva entrada de video
obj = videoinput('v4l2', '/dev/video0');
% Cambiamos el formato a RGB de 24 bits
set(obj, 'VideoFormat', 'RGB24')
% Cambiamos la resolucion para que vaya mas rapido
set(obj, 'VideoResolution', [320 240]);
% Iniciamos la entrada de video, con 2 buffers
start(obj, 2)

% Para hacer la deteccion por movimiento, primero tenemos que capturar una 
% imagen de fondo en la que no salgamos nosotros, ni nuestra mano. 
disp('Vamos a capturar la imagen de fondo. Pulsa cualquier tecla para continuar...');

% Creamos la ventana donde mostraremos el video para previsualizar antes de capturar
figFondo = figure;

x = '';
while isempty(x)
  drawnow;                      % Forzamos para que se refresque la ventana. Sin este comando el refresco se puede ralentizar mucho.
  fondo = getsnapshot(obj);     % Capturamos una imagen desde la entrada de video
  image(fondo);                 % Mostramos la imagen capturada en la ventana anterior
  x = kbhit(1);
end
figure; imshow(fondo);


% Ahora pasaremos a capturar el video en tiempo real y haremos la deteccion por
% movimiento
disp('Ahora vamos a capturar el video en tiempo real y a detectar lo que se mueva');
disp('Pulsa cualquier tecla para terminar.');

% Creamos la ventana donde mostraremos el video
fig = figure;

%%%%%%%%% COMPLETAR AQUI %%%%%%%%%
% Bucle de captura de video, detecci�n y reconocimiento
fondo_ycbcr = rgb2ycbcr(fondo);
fondocb = fondo_ycbcr(:,:,2);
  for i = 1:6

      x = '';
      while isempty(x)
        drawnow;                      % Forzamos para que se refresque la ventana. Sin este comando el refresco se puede ralentizar mucho.
        mano = getsnapshot(obj);     % Capturamos una imagen desde la entrada de video
        image(mano);                 % Mostramos la imagen capturada en la ventana anterior
        x = kbhit(1);
      end
      figure; imshow(mano);

      mano_ycbcr = rgb2ycbcr(mano);
      % Ahora pasaremos a capturar el video en tiempo real y haremos la deteccion por
      % movimiento
      disp('Ahora vamos a capturar la mano');
      disp('Pulsa cualquier tecla para terminar.');

    
    manocb = mano_ycbcr(:,:,2);
    diferencia_cb = abs(double(manocb) - double(fondocb));
    mask_cb = diferencia_cb > 6;
    
    S = regionprops( mask_cb ,'BoundingBox','FilledArea','PixelIdxList');
    boundingboxes = cat(1, S.BoundingBox);
    FilledAreas = cat(1,S.FilledArea);
    [~,MaxAreaIndex] = max(FilledAreas);
    %// Get linear indices of the corresponding silhouette to display along
    %// with its bounding box.
    MaxIndices = S(MaxAreaIndex).PixelIdxList;

    %// Create empty image to put the silhouette + box
    NewIm = false(size( mask_cb ));
    NewIm(MaxIndices) = 1;

    figure; 
    imshow(mask_cb); 
    rectangle('Position', boundingboxes(MaxAreaIndex,:), 'EdgeColor', 'r' );


    Array = boundingboxes(MaxAreaIndex,:);
    var = Array(4) / Array(3);
    var2 = Array(2) / Array(1);
    if ( (var > 1)  && ( var < 1.60) && (var2 > 1))
      text(20, 20, num2str(0), 'FontSize', 20, 'FontWeight', 'bold', 'color', 'g');
    elseif ((var >1.8)  && (var < 2.1) && (var2 > 0.7) && (var2 < 1))
      text(20, 20, num2str(1), 'FontSize', 20, 'FontWeight', 'bold', 'color', 'g');
    elseif ((var >1.6)  && (var < 1.9) && (var2 < 0.7))
      text(20, 20, num2str(2), 'FontSize', 20, 'FontWeight', 'bold', 'color', 'g');
    elseif ((var >1.6)  && (var < 1.8) && (var2 > 0.7) && (var2 < 0.8))
      text(20, 20, num2str(3), 'FontSize', 20, 'FontWeight', 'bold', 'color', 'g');
    elseif ((var >1.3)  && (var < 1.6) && (var2 > 0.7) && (var2 < 1))
      text(20, 20, num2str(4), 'FontSize', 20, 'FontWeight', 'bold', 'color', 'g');
    elseif ((var >0.8)  && (var < 1.3) && (var2 > 0.8) && (var2 < 1))
      text(20, 20, num2str(5), 'FontSize', 20, 'FontWeight', 'bold', 'color', 'g');
    endif
    

  endfor
% COMPLETAR AQU� CON EL BUCLE DE CAPTURA, LA DETECCI�N Y EL RECONOCIMIENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comprobamos si existe la variable "obj" (entrada de video) y la paramos
if exist('obj', 'var')
  stop(obj);
end

% Comprobamos si existe la variable "fig" (ventana para mostrar imagenes) y la cerramos
if exist('fig', 'var')
  close(fig);
  close(figFondo);
end