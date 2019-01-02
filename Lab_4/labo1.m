%Inicializando
clf
pkg load control

%Valores Iniciais
a = 5;
t = 0:0.1:3;
w = 2*pi;
n = 6;
%Grupo 1
      %1)f(t) = t // F(s) =  (1/s^2)
      %2)f(t) = (1-e^(-at))/a // F(s) = (1/(as + s^2))
      %3)f(t) = senh(at) // F(s) = (a/(a^2-s^2))
      
      num_1_1 = [1];
      den_1_1 = [1,0,0];
      
      num_1_2 = [1];
      den_1_2 = [1,a,0];
      
      num_1_3 = [a];
      den_1_3 = [-1,0,a**2];
      
      y_1_1 = impulse(tf(num_1_1,den_1_1),t);
      y_1_2 = impulse(tf(num_1_2,den_1_2),t);
      y_1_3 = impulse(tf(num_1_3,den_1_3),t);
      
      figure(1)
      subplot(2,2,1)
      plot(t,y_1_1,'g-');
      legend ({"y_1_1"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      subplot(2,2,2)
      plot(t,y_1_2,'r-');
      legend ({"y_1_2"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      subplot(2,2,3)
      plot(t,y_1_3,'b-');
      legend ({"y_1_3"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
%Grupo 2
      %1)f(t) = t^(n-1) // F(s) = (n-1)!/s^n
      %2)f(t) = cos(wt) // F(s) = (s/(s^2+w^2))
      %3)f(t) = e^(-at)sen(wt) // F(s) =  (w/((a+s)^2+w^2))
      
      num_2_1 = factorial(n-1);
      den_2_1 = zeros(1,n);
      den_2_1(1,1) = 1;
      
      num_2_2 = [1,0];
      den_2_2 = [1,0,w**2];
      
      num_2_3 = [w];
      den_2_3 = [1,2*a,a**2 + w**2];
      
      y_2_1 = impulse(tf(num_2_1,den_2_1),t);
      y_2_2 = impulse(tf(num_2_2,den_2_2),t);
      y_2_3 = impulse(tf(num_2_3,den_2_3),t);
      
      figure(2)
      subplot(2,2,1)
      plot(t,y_2_1,'g-');
      legend ({"y_2_1"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      subplot(2,2,2)
      plot(t,y_2_2,'r-');
      legend ({"y_2_2"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      subplot(2,2,3)
      plot(t,y_2_3,'b-');
      legend ({"y_2_3"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      
%Grupo 3
      %1)f(t) = e^(-at) // F(s) = (1/(a+s))
      %2)f(t) = te^(-at) // F(s) = (1/(a^2+2as+s^2))
      %3)f(t) = e^(-at)cos(wt) // F(s) = ((a+s)/((a+s)^2)+w^2)
      
      num_3_1 = [1];
      den_3_1 = [1,a];
      
      num_3_2 = [1];
      den_3_2 = [1,2*a,a**2];
      
      num_3_3 = [1,a];
      den_3_3 = [1,2*a,a**2 + w**2];
      
      y_3_1 = impulse(tf(num_3_1,den_3_1),t);
      y_3_2 = impulse(tf(num_3_2,den_3_2),t);
      y_3_3 = impulse(tf(num_3_3,den_3_3),t);
      
      figure(3)
      subplot(2,2,1)
      plot(t,y_3_1,'g-');
      legend ({"y_3_1"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      subplot(2,2,2)
      plot(t,y_3_2,'r-');
      legend ({"y_3_2"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');
      subplot(2,2,3)
      plot(t,y_3_3,'b-');
      legend ({"y_3_3"}, "location", "east"); 
      grid on;
      xlabel('Tempo em segundos');
      ylabel('Resposta');
      title('Resposta ao impulso da funcao no tempo');