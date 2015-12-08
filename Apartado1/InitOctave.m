% RGB > Diferencia entre el fondo y la mano6
  mano = hand_frames_training(:,:,:,6);
  fondo = calib_frame;
  diferencia = abs(double(rgb2gray(mano)) - double(rgb2gray(fondo)));
  mask = diferencia > 7;
  %figure; imshow(mask);
  %close all
% YCbCr > Diferencia entre el fondo y la mano6
% NOTA: El mejor canal para calcular las diferencias es el Cb, 
%   pero cuando implementemos la práctica en tiempo real podría ser mejor utilizar otro canal.
  mano_ycbcr = rgb2ycbcr(mano);
  fondo_ycbcr = rgb2ycbcr(fondo);
  manocb = mano_ycbcr(:,:,2);
  fondocb = fondo_ycbcr(:,:,2);
  diferencia_cb = abs(double(manocb) - double(fondocb));
  %figure; imshow(uint8(diferencia));
  mask_cb = diferencia_cb > 10;
  %figure; imshow(mask_cb);





