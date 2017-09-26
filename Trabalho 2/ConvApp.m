%% Script que implementa uma opera��o de convolu��o de imagens
% Universidade Federal da Para�ba
% Trabalho 2 de Processamento Digital de Imagens
% Equipe: Thiago Viana, Jordan Lira, Thiago Filipe e Fernando Alves
% Semestre: 2017.1

%% Fun��o main do programa
function ConvApp()
    % carregar imagem
    img = imread('ovolaovo.jpg');
    img = double(img);
    
    % aplica��o da opera��o de convolu��o [QUEST�O 1]
    % cria��o da matriz
%     mat = [1, 0, -1; 0, 0, 0; -1, 0, 1];
%     mat = double(mat);
%     output = convolve(img, mat);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat)), conv2(double(img(:,:,2)), double(mat)), conv2(double(img(:,:,3)), double(mat)));
%     imshowpair(output, outconv, 'montage');
%     disp(output);

    % QUEST�O 2A
%     c = 1; d = 1;
%     mat1 = [0, -c, 0; -c, (4*c)+d, -c; 0, -c, 0];
%     mat2 = [-c, -c, -c; -c, (8*c)+d, -c; -c, -c, -c];
%     output = convolve(img, mat1);
%     output2 = convolve(img, mat2);
%     outconv = cat(3, conv2(double(img(:,:,1)), double(mat2)), conv2(double(img(:,:,2)), double(mat2)), conv2(double(img(:,:,3)), double(mat2)));
%     imshowpair(output2, outconv, 'montage');
    
    % QUEST�O 2B
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

    % QUEST�O 2C
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