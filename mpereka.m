function px=mpereka(x,win,NN)

x=x(:);
N=length(x);

w=ones(N,1);
length(w)

        if(win==1)
            w=rectwin(N);

        elseif (win==2)
            w=hamming(N);

        elseif (win==3)
            w=hanning(N);

        elseif (win==4)
            w=bartlett(N);

        elseif (win==5)
            w=blackman(N);


        end


ww=w;
xw=x.*w;

u=sum(abs(ww).^2)/N;

px=(1/N)*abs(fft(xw,NN));
px=px.^2;

px=px/(u);

end