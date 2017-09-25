%% Script que implementa uma operação de convolução de imagens
% Universidade Federal da Paraíba
% Trabalho 2 de Processamento Digital de Imagens
% Equipe: Thiago Viana, Jordan Lira, Thiago Filipe e Fernando Alves
% Semestre: 2017.1

%% Função main do programa
function ConvApp()
    % carregar imagem
    img = imread('ovolaovo.jpg');
    img = uint8(img);
    
    % criação da matriz
    mat = [0, 0, 0; -1, 0, -1; 1, -1, 1];
    
    % aplicação da operação de convolução
    output = convolve(img, mat);
    %imshow(output);
end

function out = convolve(image, convmatrix)
    % rebatimento da matriz
    convmatrix = fliplr(convmatrix); % rebatimento horizontal da matriz
    convmatrix = flipud(convmatrix); % rebatimento vertical da matriz
    
    % aplicar operação de convolução na imagem
    [imL, imC] = size(image);
    [convL, convC] = size(convmatrix);
    out = zeros(imL, imC);
    center = floor((convL + 1)/2); %posição central da matriz de convolução
    
    % submatrizes que serão usadas dependendo do cálculo da convolução
    sub1 = convmatrix((center:convL), (center:convL));  %coluna = 1, linha = 1;
    sub2 = convmatrix((1:convL),(center:convL)); %coluna = 1, linha > 1;
    sub3 = convmatrix((center:convL),(1:convL)); %coluna > 1, linha = 1;
    sub4 = convmatrix((1:center),(1:center)); %coluna = L, linha = L;
    sub5 = convmatrix((1:convL),(1:center)); %coluna = L, linha < L;
    sub6 = convmatrix((1:center), (1:convL)); %coluna < L, linha = L;
    disp(sub1);
    
    for a = 1:imL
        for b = 1:imC
            q = a - 1;
            w = b - 1;
            if(a == 1 && b == 1)
                for i = 1:center
                    for j = 1:center
                        out(a,b) = out(a,b) + image(i + q,j + w) * sub1(i,j);
                    end
                end
            elseif (a == 1 && b > 1)
                for i = 1:convL
                    for j = 1:center
                        out(a,b) = out(a,b) + image(i + q,j + w) * sub2(i,j);
                    end
                end
            elseif (a > 1 && b == 1)
                for i = 1:center
                    for j = 1:convL
                        out(a,b) = out(a,b) + image(i + q,j + w) * sub3(i,j);
                    end
                end
            elseif (a == imL && b == imC)
                for i = 1:center
                    for j = 1:center
                        out(a,b) = out(a,b) + image(i + q,j + w) * sub4(i,j);
                    end
                end
            elseif (a == imL && b < imC)
                for i = 1:convL
                    for j = 1:center
                        out(a,b) = out(a,b) + image(i + q,j + w) * sub5(i,j);
                    end
                end
            elseif (a < imL && b == imC)
                for i = 1:center
                    for j = 1:convL
                        out(a,b) = out(a,b) + image(i + q,j + w) * sub6(i,j);
                    end
                end
            else
                for i = 1:convL
                    for j = 1:convC
                        out(a,b) = out(a,b) + image(i + q,j + w) * convmatrix(i,j);
                    end
                end
            end
        end
    end
end