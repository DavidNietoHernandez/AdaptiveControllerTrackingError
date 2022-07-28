%%%%%%%%     Estados %%%%%%%%%%%%%%%%
%x = q.signals(1).values;
%z = q.signals(2).values;
%theta = q.signals(3).values;
%gamma = q.signals(4).values;

xno = sdes.signals(1).values;
zno = sdes.signals(2).values;
theta = sdes.signals(3).values;
gamma = sdes.signals(4).values;

xd = qd.signals(1).values;
zd = qd.signals(2).values;
thetad = qd.signals(3).values;
gammad = qd.signals(4).values;

%%%%%%%%% Errores %%%%%%%%%%%%%%

Errorx = xd-xno;
Errorz = zd-zno;
Errortheta = thetad-theta;
Errorgamma = gammad-gamma;

Ex = Errorx(:,1);
Ez = Errorz(:,1);
Etheta = Errortheta(:,1);
Egamma = Errorgamma(:,1);

%%%%%%%%%%%%%% Perturbaciones %%%%%%%%%

%tiempoP=Perturbacionpend(:,1);
%PerP=Perturbacionpend(:,2);
%Perm=Perturbacionmasa(:,2);

%%%%%%%%%%%%%% Controles  %%%%%%%%%%%%%%%%%
t=Controles(:,1);

Ux=Controles(:,2);
Uz=Controles(:,3);
Utheta=Controles(:,4);
Ugamma=Controles(:,5);

%%%%%%%%%%%  Observacion  %%%%%%%%%%%%%%%%%
%ox = observacion.signals(1).values(:,1);
%oz = observacion.signals(2).values(:,1);
%otheta = observacion.signals(3).values(:,1);
%ogamma = observacion.signals(4).values(:,1);

%  oxob = observacion.signals(1).values(:,2);
% ozob = observacion.signals(2).values(:,2);
%  othetaob = observacion.signals(3).values(:,2);
%  ogammaob = observacion.signals(4).values(:,2);

% % %%%%%%%%%%%%%%%% Area %%%%%%%%%%%%%
% % 
% % xp = x-0.35*sin(gamma+theta);
% % zp = z-0.35*cos(gamma+theta);
% % 
% % xp1 = x-0.35*sin(gamma);
% % zp1 = z-0.35*cos(gamma);
% % 
% % %%%%%%%%%%%%%%%% Area2 %%%%%%%%%%%%%
% % gammaarea = -pi/2:pi/21317:pi/2;
% % thetaarea = -pi/2:pi/21317:pi/2;
% % 
% % xpa = x-0.35*sin(gammaarea.'+thetaarea.');
% % zpa = z-0.35*cos(gammaarea.'+thetaarea.');
% % 
% % xpa1 = x-0.35*sin(gammaarea.');
% % zpa1 = z-0.35*cos(gammaarea.');
% % 
% % %%%%%%%%%%%%%%%% Area3 %%%%%%%%%%%%%
% % xpa2 = -0.35*sin(gammaarea.'+thetaarea.');
% % zpa2 = -0.35*cos(gammaarea.'+thetaarea.');
% % 
% % xpa3 = -0.35*sin(gammaarea.');
% % zpa3 = -0.35*cos(gammaarea.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%    Circulo %%%%%%%%%%%%%%%%%%%%
figure(1)
%plot(x,z,xno,zno,xd,zd)
plot(xno,zno,xd,zd,'--','LineWidth',3)
leg1 = legend('Measured trajectory','Desired trajectory');
%set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
title('Trajectory','FontSize',17)
xlabel('$x[m]$','interpreter','latex','FontSize',17)
ylabel('$z[m]$','interpreter','latex','FontSize',17)

%%%%%%%%%%%%%%%% Controles %%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
subplot('Position',[0.1,0.76,0.8,0.2])
plot(t,Ux,'LineWidth',3)
title('Control inputs','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$U_h$[$N\cdot m$]','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.51,0.8,0.2])
plot(t,Uz,'LineWidth',3)
%title('Control input $z$','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$U_z$[$N\cdot m$]','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.26,0.8,0.2])
plot(t,Utheta,'LineWidth',3)
%title('Control input $\varphi$','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$U_{\varphi}$[$N\cdot m$]','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.03,0.8,0.2])
plot(t,Ugamma,'LineWidth',3)
%title('Control input $\eta$','interpreter','latex','FontSize',17)
xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$U_{\eta}$[$N\cdot m$]','interpreter','latex','FontSize',17)
grid on
grid minor

pos = get(gcf, 'Position');
set(gcf, 'Position',pos+[0 -500 0 500])
% 
% %%%%%%%%%%%%%%% Errores1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
figure(3)
subplot('Position',[0.1,0.76,0.8,0.2])
plot(t,Ex,'LineWidth',3)
title('States error','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$h[m]$','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.51,0.8,0.2])
plot(t,Ez,'LineWidth',3)
%title('Error $z$','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$z[m]$','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.26,0.8,0.2])
plot(t,Etheta,'LineWidth',3)
%title('Error $\varphi$','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$\varphi[rad]$','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.03,0.8,0.2])
plot(t,Egamma,'LineWidth',3)
%title('Error  $\eta$','interpreter','latex','FontSize',17)
xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$\eta[rad]$','interpreter','latex','FontSize',17)
grid on
grid minor

pos = get(gcf, 'Position');
set(gcf, 'Position',pos+[0 -500 0 500])

%%%%%%%%%%%%%%%%%%%%%% Estados %%%%%%%%%%%%%%%%%%%%%

figure(4)
subplot('Position',[0.1,0.77,0.8,0.16])
plot(t,xno,t,xd,'--','LineWidth',3)
leg2 = legend('Measure state','Desired state');
set(leg2,'FontSize',12);
title('States','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$h[m]$','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.55,0.8,0.16])
plot(t,zno,t,zd,'--','LineWidth',3)
leg3 = legend('Measure state','Desired state');
set(leg3,'FontSize',12);
%title('State $z$','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$z[m]$','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.3,0.8,0.2])
plot(t,theta,t,thetad,'--','LineWidth',3)
leg4 = legend('Measure state','Desired state');
set(leg4,'FontSize',12);
%title('State $\varphi$','interpreter','latex','FontSize',17)
%xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$\varphi[rad]$','interpreter','latex','FontSize',17)
grid on
grid minor

subplot('Position',[0.1,0.05,0.8,0.2])
plot(t,gamma,t,gammad,'--','LineWidth',3)
leg5 = legend('Measure state','Desired state');
set(leg5,'FontSize',12);
%title('State $\eta$','interpreter','latex','FontSize',17)
xlabel('$t[s]$','interpreter','latex','FontSize',17)
ylabel('$\eta[rad]$','interpreter','latex','FontSize',17)
grid on
grid minor

pos = get(gcf, 'Position');
set(gcf, 'Position',pos+[0 -500 0 500])
% 
% %%%%%%%%%%%%%%%%%%%%%% observacion %%%%%%%%%%%%%%%%%%%%%
%  figure(8)
%  subplot(4,1,1)
%  plot(t,ox,t,oxob)
%  title('x observada')
%  xlabel('t')
%  ylabel('m')
% % 
%  subplot(4,1,2)
%  plot(t,oz,t,ozob)
%  title('z observada')
%  xlabel('t')
%  ylabel('m')
% % 
%  
%  subplot(4,1,3)
%  plot(t,otheta,t,othetaob)
%  title('\theta observada')
%  xlabel('t')
%  ylabel('rad')
% % 
%  subplot(4,1,4)
%  plot(t,ogamma,t,ogammaob)
%  title('\gamma observada')
%  xlabel('t')
%  ylabel('rad')
% % %%%%%%%%%%%%%%%%%%%% Perturbaciones %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  figure(10)
%  plot(tiempoP,PerP,tiempoP,Perm,tiempoP,Perm+PerP)
%  title('Perturbaciones')
%  xlabel('t')
%  ylabel('Kg')
% %%%%%%%%%%%%%%%%%%%  area de trabajo %%%%%%%%%%%%%%%%%%%%%
% % figure(11)
% % plot(xp,zp,xp1,zp1)
% % title('Area')
% % xlabel('x')
% % ylabel('z')
% % 
% % figure(12)
% % p=plot(x,z,xpa,zpa,xpa1,zpa1)
% % p(1).Marker = 'p';
% % p(2).Marker = '+';
% % p(3).Marker = '.';
% % title('Area2')
% % xlabel('x')
% % ylabel('z')
% % 
% % figure(13)
% % p=plot(xpa2,zpa2,xpa3,zpa3)
% % title('Area3')
% % xlabel('x')
% % ylabel('z')
% %%%%%%%%%%%%%%% Errores2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure(11)
% subplot(2,1,1)
% plot(t,Ex,t,Ez)
% title('Error x')
% xlabel('t')
% ylabel('m')
% 
% subplot(2,1,2)
% plot(t,Etheta,t,Egamma)
% title('Error theta')
% xlabel('t')
% ylabel('rad')
% 
% %%%%%%%%%%%%%%%%%%%%%% Estados2 %%%%%%%%%%%%%%%%%%%%%
% 
% figure(12)
% subplot(2,1,1)
% plot(t,x,t,xd,t,z,t,zd)
% title('x')
% xlabel('t')
% ylabel('m')
% 
% subplot(2,1,2)
% plot(t,theta,t,thetad,t,gamma,t,gammad)
% title('theta')
% xlabel('t')
% ylabel('rad')





