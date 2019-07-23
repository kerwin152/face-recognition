function out=load_database();
% We load the database the first time we run the program.
persistent loaded;
persistent w;
if(isempty(loaded)) %Ϊ�շ���1���ǿշ���0
    v=zeros(10304,400); %����10304x400�ľ���
    for i=1:40
        cd(strcat('s',num2str(i)));%stract���ڴ����ַ������s1,s2��  cd����
        for j=1:10
            a=imread(strcat(num2str(j),'.pgm'));%�����ȡs1�е�10��ͼƬ
            v(:,(i-1)*10+j)=reshape(a,size(a,1)*size(a,2),1);
        end
        cd ..
    end
    w=uint8(v); % Convert to unsigned 8 bit numbers to save memory. 
end
loaded=1;  % Set 'loaded' to aviod loading the database again. 
out=w;