clear all
close all


%% Problem 1 a)
n = 1:50;
figure,
plot(n,ones(size(n))*2^(1/8),n,n.^(1./n))
grid on 
legend('C = 2^{1/8}','n^{1/n}')
print(gcf, '-depsc2','prob1a.eps')
system('ps2pdf -dEPSCrop prob1a.eps')

fid = fopen('prob1a.tex','w');
table1 = [n(40:45)', (n(40:45).^(1./n(40:45)))'];
fprintf(fid, '%s', sprintf('%d\t & %g \\\\\n',table1'));
fclose(fid);
type prob1a.tex

%% Problem 1 b)

n = 1:20;
figure,
plot(n,ones(size(n))*sqrt(2),n,(10*n).^(1./n))
grid on 
legend('C = \sqrt{2}','(10n)^{1/n}')
print(gcf, '-depsc2','prob1b.eps')
system('ps2pdf -dEPSCrop prob1b.eps')

fid = fopen('prob1b.tex','w');
table2 = [n(12:17)', (n(12:17).^(1./n(12:17)))'];
fprintf(fid, '%s', sprintf('%d\t & %g \\\\\n',table2'));
fclose(fid);
type prob1b.tex



