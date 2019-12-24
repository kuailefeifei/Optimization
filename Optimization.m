%% Use gradient descent to calculate minimum value of function and visualize the optimization process 
x = linspace(-2,2);
y  = x;
[X,Y] = meshgrid(x);
F = X.*exp(-X.^2-Y.^2);
figure
contour(X,Y,F,'ShowText','on');
hold on
xmin = 0.5;
ymin = 0.5;
fmin = xmin*exp(-xmin^2-ymin^2);
xSearchSpace = [xmin];
ySearchSpace = [ymin];
fSearchSpace = [fmin];

for i = 1:10
    SearchCount = 1;
    SearchLength = 1;
    dfdx = (1-2*xmin^2)*exp(-xmin^2-ymin^2);
    dfdy = -2*xmin*ymin*exp(-xmin^2-ymin^2);
    
    while SearchCount <= 10
        xmin_tmp = xmin - SearchLength*dfdx;
        ymin_tmp = ymin - SearchLength*dfdy;
        fmin_tmp = xmin_tmp*exp(-xmin_tmp^2-ymin_tmp^2);
        
        if (fmin_tmp < fmin)
            xmin = xmin_tmp;
            ymin = ymin_tmp;
            fmin = fmin_tmp;
            xSearchSpace = [xSearchSpace,xmin];
            ySearchSpace = [ySearchSpace,ymin];
            fSearchSpace = [fSearchSpace,fmin];
        else 
            SearchLength = SearchLength/3;
        end
        
        SearchCount = SearchCount + 1;   
    end
    
end
plot(xSearchSpace,ySearchSpace,'r','LineWidth',1.5)
hold off
figure
surf(X,Y,F);
hold on
plot3(xSearchSpace,ySearchSpace,fSearchSpace,'r','LineWidth',1.5)