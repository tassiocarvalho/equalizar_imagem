% Carregar a imagem  
imagem = imread('featured_image.jpg'); % Substitua pelo caminho da sua imagem

% Separar os canais R, G e B
R = imagem(:,:,1); % Canal Red
G = imagem(:,:,2); % Canal Green
B = imagem(:,:,3); % Canal Blue

% Inicializar os histogramas
hist_r = zeros(1, 256); % Histograma do canal R (256 valores possíveis, de 0 a 255)
hist_g = zeros(1, 256); % Histograma do canal G (256 valores possíveis, de 0 a 255)
hist_b = zeros(1, 256); % Histograma do canal B (256 valores possíveis, de 0 a 255)

% Obter as dimensões da imagem (altura e largura)
[altura, largura, ~] = size(imagem); % A função size retorna as dimensões da imagem

% Percorrer todos os pixels da imagem
for y = 1:altura               % Loop para percorrer cada linha da imagem (altura)
    for x = 1:largura          % Loop para percorrer cada coluna da imagem (largura)
        % Obter os valores de R, G e B para o pixel (x, y)
        valor_r = R(y, x);     % Valor de intensidade do canal vermelho no pixel (x, y)
        valor_g = G(y, x);     % Valor de intensidade do canal verde no pixel (x, y)
        valor_b = B(y, x);     % Valor de intensidade do canal azul no pixel (x, y)
        
        % Atualizar os histogramas
        % No histograma, os valores de intensidade dos canais vão de 0 a 255.
        % Como os índices do vetor histograma começam em 1 no MATLAB,
        % precisamos adicionar +1 para garantir que o índice corresponda ao valor da intensidade.
        
        hist_r(valor_r + 1) = hist_r(valor_r + 1) + 1; % Atualiza o histograma do canal R
        hist_g(valor_g + 1) = hist_g(valor_g + 1) + 1; % Atualiza o histograma do canal G
        hist_b(valor_b + 1) = hist_b(valor_b + 1) + 1; % Atualiza o histograma do canal B
    end
end

% Somar os histogramas para criar o histograma total
% O histograma total é a soma dos valores dos três canais (R, G, B).
% Isso nos dá a contagem total de cada nível de intensidade (de 0 a 255) considerando todos os canais.
hist_total = hist_r + hist_g + hist_b;

figure;


subplot(1, 3, 1); 
bar(0:255, hist_r, 'FaceColor', 'r', 'FaceAlpha', 0.7); 
title('Histograma R');

subplot(1, 3, 2); 
bar(0:255, hist_g, 'FaceColor', 'g', 'FaceAlpha', 0.7); 
title('Histograma G'); 

subplot(1, 3, 3);
bar(0:255, hist_b, 'FaceColor', 'b', 'FaceAlpha', 0.7); 
title('Histograma B'); 

set(gcf, 'Position', [100, 100, 1200, 400]);


figure;
bar(0:255, hist_total, 'FaceColor', [0.5, 0.5, 0.5], 'FaceAlpha', 0.7); 
title('Histograma Total'); 
set(gcf, 'Position', [150, 150, 600, 400]);
