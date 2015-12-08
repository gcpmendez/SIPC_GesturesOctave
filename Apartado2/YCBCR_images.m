% YCBCR con TRAINING Y TEST de las imagenes
  load FicherosPractica.mat
  pkg load image
  fondo_ycbcr = rgb2ycbcr(calib_frame);
  fondocb = fondo_ycbcr(:,:,2);
  for i = 1:6
    mano_ycbcr = rgb2ycbcr(hand_frames_training(:,:,:,i));
    manocb = mano_ycbcr(:,:,2);
    diferencia_cb = abs(double(manocb) - double(fondocb));
    mask_cb = diferencia_cb > 7;
    figure; imshow(mask_cb);
  endfor
  close all

  fondo_ycbcr = rgb2ycbcr(calib_frame);
  fondocb = fondo_ycbcr(:,:,2);
  for i = 1:6
    mano_ycbcr = rgb2ycbcr(hand_frames_testing(:,:,:,i));
    manocb = mano_ycbcr(:,:,2);
    diferencia_cb = abs(double(manocb) - double(fondocb));
    mask_cb = diferencia_cb > 7;
    figure; imshow(mask_cb);
  endfor
  %close all