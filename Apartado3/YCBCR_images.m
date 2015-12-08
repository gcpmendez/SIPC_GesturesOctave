% YCBCR con TRAINING Y TEST de las imagenes
  load FicherosPractica.mat
  pkg load image
  fondo_ycbcr = rgb2ycbcr(calib_frame);
  fondocb = fondo_ycbcr(:,:,2);
  for i = 1:6
    mano_ycbcr = rgb2ycbcr(hand_frames_training(:,:,:,i));
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

    figure;imshow( mask_cb); 
    hold on;
    rectangle('Position', boundingboxes(MaxAreaIndex,:), 'EdgeColor', 'r' );
    disp(boundingboxes(MaxAreaIndex,:));
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
  %close all

  %fondo_ycbcr = rgb2ycbcr(calib_frame);
  %fondocb = fondo_ycbcr(:,:,2);
  %for i = 1:6
  %  mano_ycbcr = rgb2ycbcr(hand_frames_testing(:,:,:,i));
  %  manocb = mano_ycbcr(:,:,2);
  %  diferencia_cb = abs(double(manocb) - double(fondocb));
  %  mask_cb = diferencia_cb > 7;
  %  figure; imshow(mask_cb);
  %endfor
  %close all