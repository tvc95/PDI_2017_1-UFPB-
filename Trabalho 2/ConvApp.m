%% Script que implementa uma opera��o de convolu��o de imagens
% Universidade Federal da Para�ba
% Trabalho 2 de Processamento Digital de Imagens
% Equipe: Thiago Viana, Jordan Lira, Thiago Filipe e Fernando Alves
% Semestre: 2017.1

%% Fun��o main do programa
function ConvApp()
    % carregar imagem
    img = imread('ovolaovo.jpg');
    img = uint8(img);
    
    % cria��o da matriz
    mat = [1, 0, -1; 0, 0, 0; -1, 0, 1];
    
    % aplica��o da opera��o de convolu��o
    output = convolve(img, mat);
    %disp();
    outconv = cat(3, conv2(double(img(:,:,1)), double(mat)), conv2(double(img(:,:,2)), double(mat)), conv2(double(img(:,:,3)), double(mat)));
    %imshow(outconv);
    imshow(output);
end

function out = convolve(image, convmatrix)
    % rebatimento da matriz
    convmatrix = fliplr(convmatrix); % rebatimento horizontal da matriz
    convmatrix = flipud(convmatrix); % rebatimento vertical da matriz
    % aplicar opera��o de convolu��o na imagem
    [imL, imC] = size(image);
    [convL, convC] = size(convmatrix);
    out = zeros(size(image));
    center = floor((convL + 1)/2); %posi��o central da matriz de convolu��o
    
    %extens�o por zeros na matriz
    image = wextend('2D', 'zpd', image, convL-center);
    
    disp(size(image));
    [outL, outC] = size(out);
    disp(size(out));
    for c = 1:3 %cores
        q = 0;
        w = 0;
        for a = 1:outL %linhas
            for b = 1:outC %colunas
%                 q = a - 1;
%                 w = b - 1;
                for i = 1:convL
                    for j = 1:convC
%                         out(a,b,c) = out(a,b,c) + image(i + q, j + w,c) * convmatrix(i, j);
                    end
                end
                disp(out(a,b,c));
            end
        end
    end
end