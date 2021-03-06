%% Script que implementa uma opera��o de convolu��o de imagens
% Universidade Federal da Para�ba
% Trabalho 2 de Processamento Digital de Imagens
% Equipe: Thiago Viana, Jordan Lira, Thiago Filipe e Fernando Alves
% Semestre: 2017.1

%% Fun��o main do programa
function ConvApp()
    % carregar imagem
    img = imread('faustao.jpg');
%     img = double(img);
    
    % aplica��o da opera��o de convolu��o [QUEST�O 1] [OK]
    % cria��o da matriz
%     mat = [1, 0, -1; 0, 0, 0; -1, 0, 1];
%     mat = double(mat);
%     output = convolve(img, mat);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat)), conv2(double(img(:,:,2)), double(mat)), conv2(double(img(:,:,3)), double(mat)));
%     imshowpair(output, outconv, 'montage');
%     disp(output);

    % QUEST�O 2A [OK]
%     c = 1; d = 1;
%     mat1 = [0, -c, 0; -c, (4*c)+d, -c; 0, -c, 0];
%     mat2 = [-c, -c, -c; -c, (8*c)+d, -c; -c, -c, -c];
%     output = convolve(img, mat1);
%     output2 = convolve(img, mat2);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat2)), conv2(double(img(:,:,2)), double(mat2)), conv2(double(img(:,:,3)), double(mat2)));
%     imshowpair(output2, outconv, 'montage');
    
    % QUEST�O 2B [OK]
%     mat = [-1/8, -1/8, -1/8; -1/8, 1, -1/8; -1/8, -1/8, -1/8];
%     mat = double(mat);
%     mat2 = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
%     mat2 = double(mat2);
%     mat3 = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
%     mat3 = double(mat3);
%     mat4 = [-1, -1, 0; -1, 0, 1; 0, 1, 1];
%     mat4 = double(mat4);
%     output = convolve(img, mat);
%     output2 = convolve(img, mat2);
%     output3 = convolve(img, mat3);
%     output4 = convolve(img, mat4);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat4)), conv2(double(img(:,:,2)), double(mat4)), conv2(double(img(:,:,3)), double(mat4)));
%     imshowpair(output4, outconv, 'montage');

%     % QUEST�O 2C [OK]
%     mat = [0,0,0; 0,1,0; 0,0,-1];
%     mat = double(mat);
%     mat2 = [0,0,-1; 0, 1, 0; 0,0,0];
%     mat2 = double(mat2);
%     mat3 = [0,0,2; 0,-1,0; -1, 0,0];
%     mat3 = double(mat3);
%     output = convolve(img, mat);
%     output2 = convolve(img, mat2);
%     output3 = convolve(img, mat3);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat3)), conv2(double(img(:,:,2)), double(mat3)), conv2(double(img(:,:,3)), double(mat3)));
%     imshowpair(output3, outconv, 'montage');

    % QUEST�O 2D
%     mat = gaussian2d(5, 2.43);
%     disp(rank(mat));
%     mat = double(mat);
%     output = convolve(img, mat);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat)), conv2(double(img(:,:,2)), double(mat)), conv2(double(img(:,:,3)), double(mat)));
%     output = uint8(output);
%     outconv = uint8(outconv);
%     imshowpair(output, outconv, 'montage');

%     % QUEST�O 2E
%     mat = gaussDerivative(5, 1.43);
%     disp(rank(mat));
%     mat = double(mat);
%     output = convolve(img, mat);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat)), conv2(double(img(:,:,2)), double(mat)), conv2(double(img(:,:,3)), double(mat)));
%     output = uint8(output);
%     outconv = uint8(outconv);
%     imshowpair(output, outconv, 'montage');
    
    % QUEST�O 2F [OK]
%     mat = [1/9, 1/9, 1/9; 1/9, 1/9, 1/9; 1/9, 1/9, 1/9];
%     disp(rank(medfilt2(img(:,:,1))));
%     mat = double(mat);
%     output = convolve(img, mat);
%     output = uint8(output);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat)), conv2(double(img(:,:,2)), double(mat)), conv2(double(img(:,:,3)), double(mat)));
%     outconv = uint8(outconv);
%     imshowpair(output, outconv, 'montage');

    % QUEST�O 5A
%      mat = [-1.0, -1.0, -1.0; -1.0, 8.0, -1.0; -1.0, -1.0, -1.0];
%      output = convolve(double(img), mat);
%      imshowpair(img ,rgb2gray(output), 'montage');
%      disp(output2);

    % QUEST�O 5b
%      smoothMat = double(gaussian2d(15, 2.43));
%      output1 = convolve(double(img), smoothMat);
%      mat = [-1.0, -1.0, -1.0; -1.0, 8.0, -1.0; -1.0, -1.0, -1.0];
%      disp(rank(mat));
%      output2 = convolve(double(output1), mat);
%      imshowpair(uint8(img),rgb2gray(output2), 'montage');
%      %disp(output2);

    % QUEST�O 7 expansao
%       a = min(img(:));  
%       b = max(img(:));
%       img2 = (img-a).*(255/(b-a));
%       imshowpair(img,img2, 'montage');

    % QUEST�O 7 equalizacao
%     I = img;
%     [height,width, numberOfColorChannels]=size(I);
%     if numberOfColorChannels > 1
%       disp(numberOfColorChannels);
%       I = rgb2gray(I);
%     end
% 
%     % Num de ocorrencias de cada nivel de cinza
%     NumPixel = compute_histogram(I);
%     % probabilidade de ocorrencia de cada nivel de cinza
%     ProbPixel = compute_normalized_histogram(NumPixel,I);
%     % destribuicao comulativa de acordo com a probabilidade
%     CumuPixel = compute_cumulative_histogram(ProbPixel);
% 
%     % Convertendo pra um novo mapa...
%     Map = zeros(1,256);
%     for i = 1:256
%         Map(i) = uint8(255 * CumuPixel(i)+0.5);
%     end
%     for i = 1:height
%         for j = 1:width
%             I(i,j)=Map(I(i,j) + 1);
%         end
%     end
%     
%     imshowpair(rgb2gray(imread('faustao.jpg')),I, 'montage');
    
end

function out = convolve(image, convmatrix)
    % rebatimento da matriz
    convmatrix = fliplr(convmatrix); % rebatimento horizontal da matriz
    convmatrix = flipud(convmatrix); % rebatimento vertical da matriz
    %% aplicar opera��o de convolu��o na imagem
    [imLine, imCol] = size(image);
    [convL, convC] = size(convmatrix);
    out = zeros(size(image));
    center = floor((convL + 1)/2); %posi��o central da matriz de convolu��o
    
    %extens�o por zeros na matriz
    image = wextend('2D', 'zpd', image, convL-center);   
    %disp(size(image));
    [outL, outC] = size(out);
    
    for c = 1:3 %cores
        for a = 1:size(out, 1) %linhas
            for b = 1:size(out,2) %colunas
                q = a - 1;
                w = b - 1;
                for i = 1:convL
                    for j = 1:convC
                        out(a,b,c) = out(a,b,c) + (image(i + q,j + w,c) * convmatrix(i, j));
                    end
                end
                if(out(a,b,c) > 255)
                    out(a,b,c) = 255;
                elseif (out(a,b,c) < 0)
                    out(a,b,c) = 0;
                end
                %disp(out(a,b,c));
            end
        end
    end
end

%% gaussiano
function f = gaussian2d(N,sigma)
     [x y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
     f=exp(-x.^2/(2*sigma^2)-y.^2/(2*sigma^2));
     f=f./sum(f(:));
end

%% derivada do gaussiano
function f = gaussDerivative(N,sigma)
     [x y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
     f=diff(exp(-x.^2/(2*sigma^2)-y.^2/(2*sigma^2)));
     f=f./sum(f(:));
end

function f = compute_histogram(I)
[height,width]=size(I);
NumPixel = zeros(1,256);
for i = 1:height
    for j = 1:width
        NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
    end
end
f = NumPixel;
end

function f = compute_normalized_histogram(NumPixel,I)
[height,width]=size(I);
ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
end
f = ProbPixel;
end

function f = compute_cumulative_histogram(ProbPixel)
CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i);
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
    end
end

f = CumuPixel;
end