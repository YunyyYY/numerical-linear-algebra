# Chapter 3 Spectral Theory

### 1. Eigenvalues

Let $A\in\mathbb C^{n\times n}$, then $(\lambda\in \mathbb C, in\mathbb C^n)$ is an eigenpair if $x\neq 0$ and $Ax = \lambda x$, i.e. $x\in \operatorname{Ker}(A-\lambda I)$.

*Eigenvectors are not unique.*

**Theorem 1**

Any $A\in\mathbb C^{n\times n}$ has $n$ eigenvalues (not necessarily distinct) and **at least one** eigenvector.

> Proof:
>
> 1. existence of eigenvectors
>
>    For any $u\in\mathbb C^n$, $u\neq 0$, the set $y:= \{u, Au, ...A^nu\} \subset \mathbb C^n$ is linearly dependent (as it has $n+1$ vectors in $n$ dimensional $\mathbb C^n$).
>
>    Thus, $\exists c_0, ...c_n$ s.t. $\sum_{j=0}^n c_jA^iu = 0$. 
>
>    Define polynomial $\mathcal P(t) := \sum_{j=0}^nc_jt^j$, polynomial of degree $n$.
>
>    We can write $\mathcal P(A)u = 0$, and since $u\neq 0$, $\mathcal P(A)$ is singular matrix and $\det \mathcal P(A) = 0$.
>
>    But since $\mathcal P(t)$ has $n$ roots $t_1$, ... $t_n$, $\mathcal P(t) = c_n\prod_{j=1}^n(t-t_j)$ and $\mathcal P(A) = c_n\prod_{j=1}^n(A-t_jI)$.
>
>    Therefore $0 = \det \mathcal P(A) = c_n\prod_{j=1}^n\det(A-t_jI)$
>
>    Thus $\exists j\in\{1, ...n\}$ s.t. $\operatorname{Ker}(A-t_jI)\neq \{0\}$, non-trivial kernel.
>
> 2. show $A$ has $n$ eigenvalues
>
>    Define <font color='orange'>**characteristic polynomial**</font> of $A$: $P_A(t) := \det(tI-A)$ polynomial of degree $n$
>
>    It is obvious that eigenvalues $\lambda$ are roots of $P_A(t)$.
>
>    By **fundamental theorem of algebra**, $P_A$ has $n$ roots, so $A$ has $n$ eigenvalues.

- **Algebraic multiplicity** $q$ of $\lambda$: largest positive integres s.t. $(t-\lambda)^q$ is a factor of $P_A(t)$.
- **Geometric multiplicity** $r$ of $\lambda$: $\dim \operatorname{Ker}(\lambda I-A)$.

#### Similarity

Square matrices $A, B\in\mathbb C^{n\times n}$ are similar if exists invertible $S\in\mathbb C^{n\times n}$ s.t. $A = SBS^{-1}$.

**Properties of similar matrices** $A, B$:

1. $\det A = \det(SBS^{-1}) = \det S\det B\det S^{-1} = \det B$
2. $\operatorname{tr}A = \operatorname{tr}(SBS^{-1}) = \operatorname{tr}(BS^{-1}S) = \operatorname{tr}B$

**Theorem 2** 

Similar matrices have the <font color='red'>same</font> eigenvalues with the same algebraic and geometrix multiplicity.

**Theorem 3** 

If $\lambda$ is eigenvalue of $A\in\mathbb C^{n\times n}$ with algebraic multiplicity $q$ and geometric multiplicity $r$ then $1\le r\le q\le n$.

> Frome rank nullity theorem ([chapter 1](c1.html)) $\operatorname{rank}A = n$ iff eigenvalues of $A$ are not 0. Otherwise $\operatorname{rank} = n - \mathrm{geometric~multiplicity~of~\lambda = 0}$. If $r=q$ there exists $q$ linearly independent eigenvectors associated with $\lambda$. If $r<q$, $\lambda$ is defective eigenvalue.



### 2. Diagonolization

Eigenvectors for distant eigenvalues are linearly independent.

**Consequence**: If $A$ has $n$ distinct eigenvalues and $A\in\mathbb C^{n\times n}$, the eigenvectors form a basis of $\mathbb C^n$. We can arrange them in invertible matrix $X:=(x_1, ...x_n)$ and define
$$
AX = X\operatorname{diag}(\lambda_1, ...\lambda_n) = X\Lambda \Leftrightarrow A= X\Lambda X^{-1}
$$
We say $A$ is diagonolized if it is reduced via transformation to diagonal $\Lambda X^{-1}AX$.

> We don't need distinct eigenvalues for **diagonolization**, we need **non-defective eigenvalues**.

#### Normal matrix

An important class of diagonalizable matrices are **normal matrices**:

$A\in \mathbb C^{n\times n}$ is normal if it has $n$ <font color='orange'>**orthogonal eigenvectors**</font>, i.e., exists **unitary** $Q$ s.t. $A = Q\Lambda Q^*$.

**Theorm 4**

$A$ is normal **if and only if** it commutes with its adjoint, i.e., $A^*A = AA^*$.

> Not all matrices are diagonalizable, thus we need other eigenvalue revealing factorization.

#### Jordan canonical form

$$
J = \left(
\begin{array}[cccc]
&J_{n_1}(\lambda_1) & 0 & \dots & 0 \\
0 & J_{n_2}(\lambda_2) & \dots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \dots & J_{n-k}(\lambda_2)
\end{array}
\right),  
\qquad 
J_p(\lambda) = \left(
\begin{array}[ccccc]
& \lambda & 1 & 0 & \dots & 0\\
0 & \lambda & 1 & \dots & 0\\
\vdots & \vdots & \vdots & \ddots & 1 \\
0 & 0 & 0 & \dots & \lambda
\end{array}
\right) \in \mathbb C^{p\times p}
$$

and $n_1+ ... + n_k = n$.

This factorization is highly unstable, and is not used in computation. It's because $S^{-1}$ is sensitive to perturbation.

#### Schur factorization

For $\forall A\in\mathbb C^{n\times n}$, exists a factorization $A = QTQ^*$ where $Q$ is unitary and $T$ is upper triangular.

Since $A$ and $T$ are similar and $T$ is upper triangular, we know the eigenvalues of $A$ are $(t_{ii})$, $i = 1, ...n$.



### 3. Spectral theorem for Hermitian matrices

**Theorem 5**

Let $A\in\mathbb C^{n\times n}$ be Hermitian. Then $A$ has real eigenvalues and is unitarily diagonoalizable (i.e. it is normal).

 

### 4. Determinant and trace

**Theorem 6**

Let $\lambda_1, ...\lambda_n$ be eigenvalues of $A$. Then $\det A = \prod_{j=1}^n\lambda_j$ and $\operatorname{tr}A = \sum_{j=1}^n\lambda_j$.

> Use characteristic polynomial of $A$ and leibnitz formula of determinant.



### 5. Norms and eigenvalues

$A^*A$ is Hermitian and positive definite. Let $\lambda$ be eigenvalue of $A^*A$,
$$
0\le \left<Ax, Ax\right> = x^*A^*Ax = \left<x, A^*Ax\right> = \left<x, \lambda x\right> = \lambda \left<x, x\right>,\quad \lambda \ge 0
$$
**Frobenious norm**
$$
\|A\|_F = \sqrt{\operatorname{tr}(A^*A)} = \sqrt{\sum_{j=1}^n\lambda_j}, \quad \lambda_j \text{ is eigenvalue of }A^*A
$$

#### Spectral norm $\|A\|_2$

Let $A\in\mathbb C^{m\times n}$ and recall matrix norm:
$$
\|A\|_2 = \sup_{x\neq 0}\frac{\|Ax\|_2}{\|x\|_2} = \sup_{x\neq 0}\sqrt{\frac{\left<Ax, Ax\right>}{\left<x,x\right>}} = \sup_{x\neq 0}\sqrt{\frac{\left<x, A^*Ax\right>}{\left<x,x\right>}}
$$

> Since $A^*A$ is Hermititan, by theorem 5 it is unitarily diagonalizable: $A^*A = Q\Lambda Q^*$.
>
> $\left<x, x\right> = \left<Q^*x, Q^*x\right>$.
>
> $\left<x, A^*Ax\right> = \left<Q^*x, \Lambda Q^*x\right>$. Denote $y=Q^*x$.
> $$
> \|A\|_2 = \sup_{x\neq 0}\sqrt{\frac{\left<Q^*x, \Lambda Q^*x\right>}{\left<Q^*x,Q^*x\right>}} = \sup_{x\neq 0}\sqrt{\frac{\left<y, \Lambda y\right>}{\left<y,y\right>}} = \sup_{y\neq 0}\sqrt{\frac{\left<\sum_{j=1}^n\lambda_j|y_j|^2\right>}{\sum_{j=1}^n|y_j|^2}} = \sqrt{\max_{j=1, ...n}\lambda_j}
> $$