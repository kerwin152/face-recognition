function out=load_database();
% We load the database the first time we run the program.
persistent loaded;
persistent w;
if(isempty(loaded)) %为空返回1；非空返回0
    v=zeros(10304,400); %返回10304x400的矩阵
    for i=1:40
        cd(strcat('s',num2str(i)));%stract用于串联字符串获得s1,s2等  cd用于
        for j=1:10
            a=imread(strcat(num2str(j),'.pgm'));%例如读取s1中的10个图片
            v(:,(i-1)*10+j)=reshape(a,size(a,1)*size(a,2),1);
        end
        cd ..
    end
    w=uint8(v); % Convert to unsigned 8 bit numbers to save memory. 
end
loaded=1;  % Set 'loaded' to aviod loading the database again. 
out=w;