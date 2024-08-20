function [x,P]=UKF(fstate,x,P,hmeas,z,Q,R)
    % Unscented Kalman Filter for nonlinear dynamic systems
    %numer of states
    L=numel(x);

    %numer of measurements
    m=numel(z);

    alpha=1e-3;
    ki=0;
    beta=2;

    %scaling factor
    lambda=alpha^2*(L+ki)-L;
    c=L+lambda;

    %weights for means
    Wm=[lambda/c 0.5/c+zeros(1,2*L)];
    Wc=Wm;

    %weights for covariance
    Wc(1)=Wc(1)+(1-alpha^2+beta);
    c=sqrt(c);

    %sigma points around x
    X=SigmaPoints(x,P,c);                            

    %unscented transformation of process
    [x1,X1,P1,X2]=UnsentTransform(fstate,X,Wm,Wc,L,Q);

    %unscented transformation of measurments
    [z1,Z1,P2,Z2]=UnsentTransform(hmeas,X1,Wm,Wc,m,R);

    %transformed cross-covariance
    P12=X2*diag(Wc)*Z2';                        

    K=P12*inv(P2);

    %state update
    x=x1+K*(z-z1);

    %covariance update
    P=P1-K*P12';
end