function [y,Y,P,Y1] = UnsentTransform(f,X,Wm,Wc,n,R)
 
    L=size(X,2);
    y=zeros(n,1);
    Y=zeros(n,L);
    for k=1:L                   
        Y(:,k)=f(X(:,k));       
        y=y+Wm(k)*Y(:,k);       
    end
    Y1=Y-y(:,ones(1,L));
    P=Y1*diag(Wc)*Y1'+R;  
end