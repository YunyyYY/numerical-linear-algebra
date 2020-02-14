# Chapter 6 QR factorization

### 1. Definition of QR

Given $A\in\C^{m\times n}$, we can think of QR as construction of an orthonormal basis $\{q_1, ...q_m\}$ of $\C^m$ where vectors span the **successive column spaces** of $A$.

**Assum henceforce $m\ge n$.**

The (reduced) QR factorization of $A\in \C^{m\times n}$ is 
$$
A = (q_1, ...q_n)\left(\begin{array}{cccc}
r_{11} & r_{12} & ... & r_{1n} \\
0 & r_{22} & ... & r_{2n} \\
0 & 0 & \ddots & \vdots \\
0 & 0 & ... & r_{nn}
\end{array}\right) = \hat Q\hat R
$$
where $\{q_i\}$ are **orthonormal**, $\hat Q$ is $m\times n$.

Full QR: $Q$ is **unitary** $m\times m$ and $R$ is $m\times n$, rest rows are filled by 0.

This means
$$
\begin{aligned}
a1 &= r_{11}q_1 \\
a2 &= r_{12}q_2 \\
... \\
a_n &= r_{1n}q_1 + ... + r_{nn}q_n
\end{aligned}
$$


$q_j\in\operatorname{span}\{a_1, ...a_j\}, j = 1,...n$.

**Remark**:

1. $A$ has full rank (equal to $n$) iff $R_{jj}\neq 0$ for $\forall j=1, ...n$.
2. In the case $m<n$, we have $A^* = QR$, and $A = (QR)^* = R^*Q^*$ factorization, with $R^*$ lower triangular.



### 2. Gram-Schmidt orthogonalization

**Theorem 1**: every $A\in\C^{m\times n}$, $m\ge n$, has a QR factorization. If $A$ has full rank, there is a unique QR (reduced form) with **strictly positive entries** on the diagonal of $R$.

INPUT: $A\in\C^{m\times n}$, $m\ge n$

OUTPUT: $Q\in\C^{m\times n}$ unitary, $R\in\C^{m\times n}$ upper triangular s.t. $A = QR$.

​	$R:= 0$

​	FOR $j=1, ...n$ DO

​		$\tilde q_j = a_j - \sum_{k=1}^{j-1}r_{kj}q_k$, where $r_{kj} = \left<q_k, a_j\right>$.

​		$r_{jj} = \|\tilde q_j\|_2$

​		IF $r_{jj} > 0$ THEN

​			$q_{j} = \tilde q_j / r_{jj}$

​		ELSE

​			$q_j = $ arbitrary $\perp \operatorname{span}\{q_1, ...q_{j-1}\}$, $\|q_j\|_2 = 1$

​		END IF

​	END FOR

> **Understanding the algorithm**
>
> - $j = 1$, $\tilde q_1 = a_1$ and $r_{11} = \|\tilde q_1\|_2$
>
>   if $r_{11} = 0$, pick whatever $q_1$ satisfying $\|q_1\|_2 = 1$.
>
> - $j=2$, $\tilde q_2 = a_2 - r_{12}q_1 = a_2-q_1\left<q_1, a\right> = (I-q_1q_1^*)a_2$
>
>   $(I-q_1q_1^*)$ is the complement of $q_1q^*_1$, which is the projector on the line space of $q$. Therefore, $(I-q_1q_1^*)$ is a projector on $[\operatorname{span}\{q_1\}]^\perp$
>
> - other $j$: $\tilde q_j = (I - \sum_{k=1}^{j-1}q_kq_k^*)a_j$, projection of $a_j$ on $[\operatorname{span}\{q_1, ...q_{k-1}\}]^\perp$

G-S algorithm is only used in theory due to finite precision representation in computers, which will lead to __loss of orthogonality__. It is inaccurate and unstable.

A slight improvement is __modified Gram-Schmidt__ which achieve the same thing in a slightly different way. (lecture 8, pages 56-59)



### 3. Householder matrix (transform)

Let $x\in\C^n$, $\|x\|_2=1$. The householder matrix (transform) associated to it is $H_x := I_n - 2xx^*$.

**Properties**:

1. $H_x$ is unitary and Hermitian: $H_x^* = H_x$

   $H_x^2 = (I_n-2xx^*)(I_n-2xx^*) = I_n - 4xx^* + 4x(x^*x)x^* = I_n$

   Unitary: $A^*A = AA^* = I$, since $H_x^* = H_x$ and $H_x^2 = H_xH_x^* = I$

2. $\det|H_x| = 1$

   Since $H_x$ is unitary, $\det H_x\det H_x^* = \det^2 H_x = det I_n = 1$.

3. $H_x$ acts as an **identity** on $[\operatorname{span}\{x\}]^\perp$ and a **reflector** on $\operatorname{span}\{x\}$.

**Lemma**: $\forall x\in\C^n$, define 
$$
v^\mp := \frac{x_1}{|x_1|}\|x\|_2e_1\mp x
$$
Then the corresponding householder matrix for $v$ is
$$
H^\mp := I_n - \frac{2v^\mp(v^\mp)^*}{\|v^\mp\|_2^2}
$$
and for the vector $x$ which construct $v$ and $H$, it satisfies:
$$
x \rightarrow H^\mp x = \frac{x_1}{|x_1|}\|x\|_2e_1 = \pm\|x\|_2x_1
$$
![](/Users/kelly/Desktop/2020_Winter/571/numerical-linear-algebra/additional/c6_householder.jpg)

As previously mentioned, $H_v$ acts as identity on $[\operatorname{span}\{v\}]^\perp$ and a reflector on $\operatorname{span}\{v\}$. We can decompose $x$ on $\operatorname{span}\{v^-\}$ and $\operatorname{span}\{v^+\}$ and use this property to find $Hx$, which is $H^\mp x = \pm\|x\|_2x_1$.

Since in computation we wish to avoid subtracting nearby quantities, it's better to use Householder transform $H^+$.



### 4. QR via Householder transform

Householder transform can be used to introduce zeroes below the diagonal, column by column.

**Algorithm**

INPUT: $A\in\C^{m\times n}$

FOR $k=1, ... m$ DO

​	$x = A(k:m, k)$

​	$v = \frac{x_1}{|x_1|}\|x\|_2e_1 + x$

​	$v = \frac{v}{\|v\|}$

​	$A(k:m, k:n) = A(k:m, k:n) - 2v[v^*A(k:m,k:n)]$

END FOR

> For each iteration, only the first column $k$th sub-matrix $A(k:m,k:n)$ will have all zeros except for first element. See additional explanation [here](additional/c6-4.pdf).





