
# Importando as Bibliotecas Necessárias

import numpy as np
import pandas as pd
from scipy.io import loadmat
from numpy.linalg import inv
import matplotlib.pyplot as plt


# Lendo os Dados que estão no Fomato do Matlab

grupo3 = loadmat("GrupoRobo_3.mat")


# Transformando os Dados em um DataFrame


dados = pd.DataFrame(grupo3['z1'])


# Isolando os Dados de Saída e de Entrada

Y = dados[0]
U = dados[1]


# Organizando a Matriz X

X = []
a = 0
a1 = 0
b = 0
b1 = 0
for i in range(len(Y)):
    k=i-2
    if(k==-2 and (k+1)==-1):
        X.append([a,a1,b,b1])
    elif(k==-1):
        a=Y[k+1]
        b=U[k+1]
        X.append([a,a1,b,b1])
    else:
        a=Y[i-1]
        b=U[i-1]
        a1=Y[i-2]
        b1=U[i-1]
        X.append([a,a1,b,b1])


# Transformando X em um array

X = np.array(X)

print("Array X : ")
print("\n")
print(X)
print("\n")


# Transformando Y e U em um array


Y = np.array(Y)
U = np.array(U)
print("Array Y : ")
print("\n")
print(Y)
print("\n\n")
print("Array U : ")
print("\n")
print(U)
print("\n")


# Obter os Parâmetros Estimados


o = (inv(X.T @ X)@(X.T))@Y

print("Parâmetros O (Estimados) : ")
print("\n")
print(o)
print("\n")


# Obter a Soma do Quadrado dos Erros


e = (Y-X@(o.T))@((Y-X@(o.T)).T)


print("Soma do Quadrado dos Erros : ")
print("\n")
print(e)
print("\n")


# Comparando os Dados Preditos com os Valores Corretos


Comparar = pd.DataFrame({'Correto':Y,'Predito':X@(o.T)})


print("Data Frame para Comparar:")
print("\n")
print(Comparar)


# Gráfico com os Valores Preditos e Corretos
# no decorrer do Tempo

T = 0.25
aux = 0
Amostragem = []
for i in range(len(Y)):
    aux += T
    Amostragem.append(aux)


plt.plot(Amostragem,Y,color='orange',label='Correto')
plt.step(Amostragem,X@(o.T),color='blue',label='Predito')
plt.title('Estabilização da Potência') 
plt.legend(loc='center right',fontsize=13)
plt.xlabel('Tempo')
plt.ylabel('Potência do Motor')
plt.grid(True)
plt.show()

