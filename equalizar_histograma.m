% Função principal para equalizar uma imagem colorida
function imagem_equalizada = equalizar_histograma_corretamente()
    % Carregar a imagem
    imagem = imread('contraste.jpg'); % Substitua pelo caminho da sua imagem

    % Separar os canais R, G e B
    R = imagem(:, :, 1); % Canal vermelho
    G = imagem(:, :, 2); % Canal verde
    B = imagem(:, :, 3); % Canal azul

    % Equalizar cada canal separadamente
    R_eq = equalizar_canal(R); % Canal vermelho equalizado
    G_eq = equalizar_canal(G); % Canal verde equalizado
    B_eq = equalizar_canal(B); % Canal azul equalizado

    % Recombinar os canais em uma única imagem
    imagem_equalizada = cat(3, R_eq, G_eq, B_eq);

    % Exibir a imagem original e a equalizada
    figure;
    subplot(1, 2, 1);
    imshow(imagem);
    title('Imagem Original');

    subplot(1, 2, 2);
    imshow(imagem_equalizada);
    title('Imagem Equalizada');

    % Exibir os histogramas originais e equalizados
    plotar_histogramas(R, G, B, R_eq, G_eq, B_eq);

    % Exibir o histograma total (original e equalizado)
    plotar_histograma_total(imagem, imagem_equalizada);
end

% Função para equalizar um canal individual
function canal_equalizado = equalizar_canal(canal)
    % Calcular o histograma do canal (256 níveis de intensidade)
    histograma = imhist(canal);

    % Calcular a função de distribuição acumulada (CDF)
    cdf = cumsum(histograma) / numel(canal); % Soma acumulada normalizada

    % Mapear os níveis de intensidade com base na CDF
    mapeamento = uint8(255 * cdf); % Escalar para valores entre [0, 255]

    % Aplicar o mapeamento aos pixels do canal
    canal_equalizado = mapeamento(canal + 1); % Substituir os valores originais pelos equalizados
end

% Função para plotar histogramas originais e equalizados (separados por canal)
function plotar_histogramas(R, G, B, R_eq, G_eq, B_eq)
    figure;

    % Histograma do canal vermelho
    subplot(3, 2, 1);
    bar(imhist(R), 'r');
    title('Histograma Original - Vermelho');
    xlim([0 255]);

    subplot(3, 2, 2);
    bar(imhist(R_eq), 'r');
    title('Histograma Equalizado - Vermelho');
    xlim([0 255]);

    % Histograma do canal verde
    subplot(3, 2, 3);
    bar(imhist(G), 'g');
    title('Histograma Original - Verde');
    xlim([0 255]);

    subplot(3, 2, 4);
    bar(imhist(G_eq), 'g');
    title('Histograma Equalizado - Verde');
    xlim([0 255]);

    % Histograma do canal azul
    subplot(3, 2, 5);
    bar(imhist(B), 'b');
    title('Histograma Original - Azul');
    xlim([0 255]);

    subplot(3, 2, 6);
    bar(imhist(B_eq), 'b');
    title('Histograma Equalizado - Azul');
    xlim([0 255]);
end

% Função para plotar o histograma total (original e equalizado)
%%function plotar_histograma_total(imagem_original, imagem_equalizada)
    % Converter as imagens para tons de cinza para somar os canais RGB
    %%imagem_original_gray = sum(imagem_original, 3) / 3;
    %%imagem_equalizada_gray = sum(imagem_equalizada, 3) / 3;

    % Calcular histogramas totais
    %hist_original = imhist(uint8(imagem_original_gray));
    %hist_equalizado = imhist(uint8(imagem_equalizada_gray));

    % Plotar os histogramas
    %figure;

    % Histograma Total Original
   % subplot(1, 2, 1);
   % bar(hist_original, 'k');
  %  title('Histograma Total Original');
   % xlim([0 255]);

    % Histograma Total Equalizado
   % subplot(1, 2, 2);
    %bar(hist_equalizado, 'k');
   % title('Histograma Total Equalizado');
   % xlim([0 255]);
%end%%
