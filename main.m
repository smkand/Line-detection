orig=imread('building.pnm');
%orig = rgb2gray(orig);
imshow(orig);
f=edge(orig,'canny');
%edit
shapes_theta = [0,pi/1000,pi/2];
[shapes_accum,shapes_rho] = hough( f , shapes_theta );
shapes_accum_rescaled = rescaleDiffImage(shapes_accum);
imwrite(shapes_accum_rescaled, '\\Client\H$\Desktop\test\shapes_accum.png');
shapes_rho = shapes_rho
thold = .9;
params = findmaxima( shapes_accum, shapes_theta, shapes_rho, thold );
shapes_accum_points = drawpoints( shapes_accum_rescaled, params, shapes_theta, shapes_rho );

imwrite(shapes_accum_points,'\\Client\H$\Desktop\test\shapes_accum_points_0.9.png');
%figure();
%imshow(shapes_accum_points)

shapes_lines = drawlines( shapes_accum_rescaled, params );
imwrite(shapes_lines,'\\Client\H$\Desktop\test\shapes_lines_0.10.png');
%figure();

%imshow(shapes_lines)

shapes_lines = drawlines( f, params );


imwrite(shapes_lines,'\\Client\H$\Desktop\test\shapes_lines_0.11_canny.png');
%figure();

%imshow(shapes_lines)
shapes_lines = drawlines( orig, params );
imwrite(shapes_lines,'\\Client\H$\Desktop\test\shapes_lines_0.12_orig.png');
%figure();
%imshow(shapes_lines)

thold = .7;
params = findmaxima( shapes_accum, shapes_theta, shapes_rho, thold );
shapes_accum_points = drawpoints( shapes_accum_rescaled, params, shapes_theta, shapes_rho );
imwrite(shapes_accum_points,'\\Client\H$\Desktop\test\shapes_accum_points_0.13.png');
%figure();
%imshow(shapes_accum_points)

shapes_lines = drawlines( shapes_accum_rescaled, params );
imwrite(shapes_lines,'\\Client\H$\Desktop\test\shapes_lines_0.14.png');
%figure();
%imshow(shapes_lines)

shapes_lines = drawlines( f, params );
imwrite(shapes_lines,'\\Client\H$\Desktop\test\shapes_lines_0.15_canny.png');
%figure();
%imshow(shapes_lines)
shapes_lines = drawlines( orig, params );


imwrite(shapes_lines,'\\Client\H$\Desktop\test\shapes_lines_0.16_orig.png');
%figure();
%imshow(shapes_lines)
