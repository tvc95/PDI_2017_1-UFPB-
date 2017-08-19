%% Script que abre, exibe, manipula e salva imagens RGB de 24 bits por pixel
% Universidade Federal da Paraíba
% Trabalho 1 de Processamento Digital de Imagens
% Equipe: Thiago Viana, Jordan Lira, Thiago Filipe e Fernando Alves
% Semestre: 2017.1

%% Função main do programa
function ImageEditScript()
    %% carregar imagens
    img = imread('hqdefault.jpg');
    img = uint8(img);
    img2 = imread('ovolaovo.jpg');
    img2 = uint8(img2);
    
    %% operações com imagens
    yuv = convertToYUV(img);
    rgb = convertToRGB(yuv);
    neg = negative(img);
    r = redBand(img);
    g = greenBand(img);
    b = blueBand(img);
    addbright = addBrightness(img, 0);
    mulBright = mulBrightness(img, 1);
    avg = avgFilter(img, 7);
    med = medianFilter(img, 4);
    contrast = filterContrast(img, 27, 222);
    pair = mergeImages(img, img2);
    
    %% mostra a imagem original e após a alteração
    imshowpair(img,pair,'montage');
    
end

%% Conversão RGB -> YUV
function toYUV = convertToYUV(image)
    %pega os valores RGB separadamente
    R = image(:,:,1);
    G = image(:,:,2);
    B = image(:,:,3);
    %aplicação das fórmulas para conversão para YUV
    Y = 0.299*R + 0.587*G + 0.114*B;
    U = -0.147*R - 0.289*G + 0.436*B;
    V = 0.615*R - 0.515*G - 0.1*B;
    %clamping values (necessário para as cores ficarem corretas)
    Y = max(min(R,235),16);
    U = max(min(G,240),16);
    V = max(min(B,240),16);
    toYUV = cat(3, Y, U, V);
end

%% Conversão YUV -> RGB
function toRGB = convertToRGB(imgYUV)
    Y = imgYUV(:,:,1);
    U = imgYUV(:,:,2);
    V = imgYUV(:,:,3);
    R = Y + 1.14*V;
    G = Y - 0.395*U - 0.581*V;
    B = Y + 2.032*U;
    %clamping values (necessário para as cores ficarem corretas)
    R = max(min(Y,255),0);
    G = max(min(U,255),0);
    B = max(min(V,255),0);
    toRGB = cat(3, R, G, B);
end

%% Negativo (intensidade na saída = 255 – intensidade na entrada)
function neg = negative(image)
    neg = 255 - image;
end

%% Controle de brilho aditivo (valor do pixel resultante = valor do pixel original + c)
function output = addBrightness(image, number)
    output = image + number;
end

%% Controle de brilho multiplicativo (valor do pixel resultante = valor do pixel original * c)
function output = mulBrightness(image, number)
    output = image * number;
end

%% Banda individual (RED)
function red = redBand(image)
    R = image(:,:,1);
    a = zeros(size(image, 1), size(image, 2));
    red = cat(3, R, a, a); %concatena a faixa vermelha da imagem com os zeros, deixando apenas a banda vermelha da imagem
end

%% Banda individual (GREEN)
function green = greenBand(image)
    G = image(:,:,2);
    a = zeros(size(image, 1), size(image, 2)); %cria uma matriz bidimensional de zeros
    green = cat(3, a, G, a); %concatena a faixa verde da imagem com os zeros, deixando apenas a banda verde da imagem
end

%% Banda individual (BLUE)
function blue = blueBand(image)
    B = image(:,:,3);
    a = zeros(size(image, 1), size(image, 2));
    blue = cat(3, a, a, B); %concatena a faixa azul da imagem com os zeros, deixando apenas a banda azul da imagem
end

%% Filtro de suavização de média
function filt = avgFilter(image, n)
    %devemos aplicar o filtro de suavização para o R, G e B, separadamente
    R = filter2(fspecial('average', n), image(:,:,1))/255;
    G = filter2(fspecial('average', n), image(:,:,2))/255;
    B = filter2(fspecial('average', n), image(:,:,3))/255;
    filt = cat(3, R, G, B);
end

%% Filtro de suavização (mediana)
function filt2 = medianFilter(image, n)
    %suavização da imagem é feita em cada cor, similar a suavização da
    %média
    R = medfilt2(image(:,:,1), [n n]);
    G = medfilt2(image(:,:,2), [n n]);
    B = medfilt2(image(:,:,3), [n n]);
    filt2 = cat(3, R, G, B);
end

%% Filtro de controle de contraste adaptativo
function out = filterContrast(image, n, c)
    %calcula-se o desvio padrão da vizinhança
    Rstd = std2(image(:,:,1));
    Gstd = std2(image(:,:,2));
    Bstd = std2(image(:,:,3));
    imgstd = cat(3, Rstd, Gstd, Bstd);
    
    %Se o desvio padrão for zero, recebe o R, G ou B da imagem original.
    %Caso contrário, efetua-se o cálculo da média e aplica a fórmula
    %g(i,j) = a(i,j) + (c/std(i,j))*(f(i,j) - a(i,j))
    for count = 1:3
        if(imgstd(:,:,count) == 0)
            if count == 1
                Rcontrast = image(:,:,1);
            elseif count == 2
                Gcontrast = image(:,:,2);
            elseif count == 3
                Bcontrast = image(:,:,3);
            end
        else
            if(count == 1)
                R = filter2(fspecial('average', n), image(:,:,1))/255; %média do R
                R = uint8(R);
                Rcontrast = R + (c/Rstd)*(image(:,:,1) - R);
            elseif (count == 2)
                G = filter2(fspecial('average', n), image(:,:,2))/255; %média do G
                G = uint8(G);
                Gcontrast = G + (c/Gstd)*(image(:,:,2) - G);
            elseif (count == 3)
                B = filter2(fspecial('average', n), image(:,:,3))/255; %média do B
                B = uint8(B);
                Bcontrast = B + (c/Bstd)*(image(:,:,3) - B);
            end
        end
    end
    
    out = cat(3, Rcontrast, Gcontrast, Bcontrast);
end

%% Recebe duas imagens de dimensões idênticas como entrada e vai mesclá-las.
function out = mergeImages(image1, image2)
    R = (image1(:,:,1) + image2(:,:,1))/2;
    G = (image1(:,:,2) + image2(:,:,2))/2;
    B = (image1(:,:,3) + image2(:,:,3))/2;
    out = cat(3, R, G, B);
end
