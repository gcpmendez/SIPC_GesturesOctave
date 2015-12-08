% RGB con TRAINING Y TEST de las imagenes
  load FicherosPractica.mat
  pkg load image
  fondo = calib_frame;
  for i = 1:6
    mano = hand_frames_training(:,:,:,i);
    diferencia = abs(double(rgb2gray(mano)) - double(rgb2gray(fondo)));
    mask = diferencia > 7; 
    figure; imshow(mask);
  endfor
  close all

  fondo = calib_frame;
  for i = 1:6
    mano = hand_frames_testing(:,:,:,i);
    diferencia = abs(double(rgb2gray(mano)) - double(rgb2gray(fondo)));
    mask = diferencia > 7; 
    figure; imshow(mask);
  endfor
  %close all