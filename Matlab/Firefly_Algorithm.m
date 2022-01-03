% ------------- Start the Firefly Algorithm (FA) ----------------------- % 

n=20;                  % Popülasyon büyüklüğü (ateş böceği sayısı)
alpha=1.0;             % Randomness strength(Rastgelelik gücü) 0-1
beta0=1.0;             % Attractiveness constant(çekicilik sabiti)
gamma=0.01;            % Absorption coefficient(Absorpsiyon katsayısı)
theta=0.97;            % Randomness reduction factor theta=10^(-5/tMax)
                       % (Rastgelelik azaltma faktörü)
d=2;                   % Değişken sayısı
tMax=500;              % Maximum number of iterations
                       % (Maksimum yineleme sayısı)
Lb=-10*ones(1,d);      % Lower bounds/limits (Alt sınır)
Ub=10*ones(1,d);       % Upper bounds/limits (Üst sınır)
fprintf('Fonksiyonlar \n');
fprintf('6=Rastragin \n');
fprintf('10=Sargan \n');
fprintf('17=DixonPrice \n');
h = input('Seçtiğiniz Fonksiyonun Numarasını Girin: ');
switch h
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 6

    %Generate Initial population randomly(İlk popülasyonu rastgele oluştur)
    for i=1:n
        population(i,:)=Lb+(Ub-Lb).*rand(1,d);
	    Lightn(i) = Rastragin(population(i,:));
    end
     
    % Firefly Algorithm Main Loop
    for k=1:tMax        
        alpha=alpha*theta;     % Reduce alpha by a factor theta
                               % (Alfayı bir faktör teta kadar azaltın)
        scale=abs(Ub-Lb);      % Scale of the optimization problem
                               % (Optimizasyon probleminin ölçeği)
        
        % Two loops over all the n fireflies
        for i=1:n
            for j=1:n
                % Evaluate the objective values of current solutions
                Lightn(i)=Rastragin(population(i,:));% Call the objective
                % Update moves
                if Lightn(i)>=Lightn(j)% daha parlaksa daha çekici
                    r=sqrt(sum((population(i,:)-population(j,:)).^2));
                    beta=beta0*exp(-gamma*r.^2);  % çekicilik
                    steps=alpha.*(rand(1,d)-0.5).*scale;
                    % Konum vektörlerini güncellemek için FA denklemi
                    population(i,:)=population(i,:)...
                        +beta*(population(j,:)-population(i,:))+steps;
                end
            end % end for j
	    end % end for i
        
        % Yeni çözümlerin sınırlar içinde olup olmadığını kontrol edin
        population=findlimits(n,population,Lb,Ub);
        % Ateşböceklerini ışık yoğunluğuna göre sıralayın
        [Lightn,Index]=sort(Lightn);
        nsol_tmp=population;
        for i=1:n
            population(i,:)=nsol_tmp(Index(i),:);
        end
        
        % Mevcut en iyi çözümü bulun ve çıktıları görüntüleyin
        fbest = Lightn(1), nbest = population(1,:)
    end % End of the main FA loop (up to tMax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 10

    %Generate Initial population randomly(İlk popülasyonu rastgele oluştur)
    for i=1:n
        population(i,:)=Lb+(Ub-Lb).*rand(1,d);
	    Lightn(i) = Sargan(population(i,:));
    end
     
    % Firefly Algorithm Main Loop
    for k=1:tMax        
        alpha=alpha*theta;     % Reduce alpha by a factor theta
                               % (Alfayı bir faktör teta kadar azaltın)
        scale=abs(Ub-Lb);      % Scale of the optimization problem
                               % (Optimizasyon probleminin ölçeği)
        
        % Two loops over all the n fireflies
        for i=1:n
            for j=1:n
                % Evaluate the objective values of current solutions
                Lightn(i)=Sargan(population(i,:));% Call the objective
                % Update moves
                if Lightn(i)>=Lightn(j)% daha parlaksa daha çekici
                    r=sqrt(sum((population(i,:)-population(j,:)).^2));
                    beta=beta0*exp(-gamma*r.^2);  % çekicilik
                    steps=alpha.*(rand(1,d)-0.5).*scale;
                    % Konum vektörlerini güncellemek için FA denklemi
                    population(i,:)=population(i,:)...
                        +beta*(population(j,:)-population(i,:))+steps;
                end
            end % end for j
	    end % end for i
        
        % Yeni çözümlerin sınırlar içinde olup olmadığını kontrol edin
        population=findlimits(n,population,Lb,Ub);
        % Ateşböceklerini ışık yoğunluğuna göre sıralayın
        [Lightn,Index]=sort(Lightn);
        nsol_tmp=population;
        for i=1:n
            population(i,:)=nsol_tmp(Index(i),:);
        end
        
        % Mevcut en iyi çözümü bulun ve çıktıları görüntüleyin
        fbest = Lightn(1), nbest = population(1,:)
    end % End of the main FA loop (up to tMax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    case 17

    %Generate Initial population randomly(İlk popülasyonu rastgele oluştur)
    for i=1:n
        population(i,:)=Lb+(Ub-Lb).*rand(1,d);
	    Lightn(i) = DixonPrice(population(i,:));
    end
     
    % Firefly Algorithm Main Loop
    for k=1:tMax        
        alpha=alpha*theta;     % Reduce alpha by a factor theta
                               % (Alfayı bir faktör teta kadar azaltın)
        scale=abs(Ub-Lb);      % Scale of the optimization problem
                               % (Optimizasyon probleminin ölçeği)
        
        % Two loops over all the n fireflies
        for i=1:n
            for j=1:n
                % Evaluate the objective values of current solutions
                Lightn(i)=DixonPrice(population(i,:));% Call the objective
                % Update moves
                if Lightn(i)>=Lightn(j)% daha parlaksa daha çekici
                    r=sqrt(sum((population(i,:)-population(j,:)).^2));
                    beta=beta0*exp(-gamma*r.^2);  % çekicilik
                    steps=alpha.*(rand(1,d)-0.5).*scale;
                    % Konum vektörlerini güncellemek için FA denklemi
                    population(i,:)=population(i,:)...
                        +beta*(population(j,:)-population(i,:))+steps;
                end
            end % end for j
	    end % end for i
        
        % Yeni çözümlerin sınırlar içinde olup olmadığını kontrol edin
        population=findlimits(n,population,Lb,Ub);
        % Ateşböceklerini ışık yoğunluğuna göre sıralayın
        [Lightn,Index]=sort(Lightn);
        nsol_tmp=population;
        for i=1:n
            population(i,:)=nsol_tmp(Index(i),:);
        end
        
        % Mevcut en iyi çözümü bulun ve çıktıları görüntüleyin
        fbest = Lightn(1), nbest = population(1,:)
    end % End of the main FA loop (up to tMax)
end
